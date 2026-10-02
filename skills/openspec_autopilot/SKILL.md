---
name: openspec_autopilot
description: Autonomous pipeline on OpenSpec — proposal, clarification, specs, design, plan review, tasks, apply, then code review, security review and QA as tracked Verification tasks — using the agentic-sdlc / agentic-lite schemas. Every stage runs in its own sub-agent. No manual gates. Skips what `openspec status` reports as done. Can start from an existing `/specify` spec file.
---

# OpenSpec Autopilot Skill

Run the autopilot pipeline on top of OpenSpec. The `agentic-sdlc` and `agentic-lite` schemas (in this repo's `openspec-schemas/`) define the planning artifacts and their order; `openspec status` is the source of truth for what is done; `openspec instructions` feeds each sub-agent its stage rules, template and project context. Code review, security review, QA and validation are the fixed **Verification** group in `tasks.md`: each runs in a fresh sub-agent, writes its report to `reviews/`, and is ticked only on a passing verdict. Because `openspec archive` will not proceed with unticked tasks, the CLI itself enforces the review gate, and the archive carries the full audit trail.

## When to Activate

This skill is relevant when:
- The project uses OpenSpec (has an `openspec/` directory) and the user wants idea-to-code in one shot
- The user says "openspec autopilot", "autopilot with openspec", or asks to run the pipeline on an OpenSpec change
- The user names an existing OpenSpec change and wants it driven to reviewed, working code
- The user points at an existing product spec (e.g. `docs/<version>/specs/<slug>-spec.md` from `/specify`) and wants to continue from it on OpenSpec

For projects without OpenSpec, use `autopilot` instead.

## Core Principles

### OpenSpec Is the State
- Artifact completion comes from `openspec status --change <id> --json`: `done` / `skipped` are complete, `ready` is next, `blocked` waits.
- Never skip an artifact the CLI reports `ready`; never redo one it reports `done`.
- Living specs (`openspec/specs/`) change only through delta specs and `openspec archive`.

### Gates Are Files
- `clarification.md` and `plan-review.md` are written only with an APPROVED verdict. Because later artifacts `require` them, the dependency graph enforces the review gate.
- Review rounds that fail go to `reviews/<artifact>-round-<n>.md`. Never hand-write a gate file to unblock the graph.

### Sub-Agent Delegation
- One fresh sub-agent per artifact, per review round, per fix, and per Verification task.
- Prompts are self-contained: project root, change id, original request, and the command `openspec instructions <artifact|apply> --change <id>`. Don't paraphrase schema rules into the prompt — the CLI output carries the instruction, template, `config.yaml` context/rules and dependency paths.
- Gate reviewers do exactly one round and do not fix; the orchestrator decides open questions and dispatches a separate fix sub-agent.
- Sub-agents return files written, verdict tokens and findings — never whole files.
- Code-touching sub-agents use LSP capabilities (go-to-definition, find-references, rename, diagnostics) when available, text search otherwise.
- No sub-agent mechanism? Run the stages inline in the same order.

### Right-Size by Schema
- `agentic-lite` for explicit briefs: bugfix with repro, named removal, config change, refactor, or a plan already exists. Brief → specs (or `skip_specs: true`) → design → plan-review → tasks. Never write a product spec backwards from a plan.
- `agentic-sdlc` for anything needing product definition: proposal (full `/specify` content, technology-agnostic) → clarification (product review of the proposal alone, like `/clarify` after `/specify`) → specs (capability mapping + scenarios, with a coverage table in `reviews/spec-coverage.md`) → design → plan-review → tasks.
- Plan review is in both schemas and is never cut.
- Tasks collapse: when plan review records "transcribe", the tasks step converts Proposed Changes 1:1 without re-planning.
- Security is decided at planning time: the tasks step writes the security review task if `design.md`'s Security Surface has a "yes", else a waiver task. The orchestrator re-checks against the diff and upgrades a waiver to a review if server surface was touched.
- The Gates task runs the full gate set once and records it in `reviews/gates.md`; the Verification tasks check deltas instead of re-running everything (a fix that changes code re-runs the gates).

### Reviews Are Tasks
- Every `tasks.md` ends with **Gates** and **Verification** groups (code review, security review or waiver, QA with `/opsx:verify` + `/quality`, `openspec validate --strict`).
- Tick a Verification box only when its report passes; never to get past archive.
- The same tasks drive the step-by-step route: `/opsx:apply` runs them too, spawning fresh reviewer sub-agents where the tool supports it.

### Import Existing Specs
- Given a `/specify` spec file, create an `agentic-sdlc` change named after its slug and let an import sub-agent transcribe it into `proposal.md`, following the IMPORT MODE section of `openspec instructions proposal`.
- Transcription, not a rewrite: sections map 1:1 (Problem Statement → `## Why`, condensed only if over 1000 characters); only `## What Changes` is written fresh; nothing is dropped; the source file is never edited.
- A provenance block links the source, a prior `clarification-review.md` that names this spec, and an existing `docs/*/plans/<slug>-plan.md`. Clarification uses the prior review so settled decisions aren't asked again; design builds on the existing plan.
- A real spec always gets `agentic-sdlc`, even with a plan, because its acceptance criteria must become delta specs. `agentic-lite` is for plans *without* a spec.
- Already imported? A change whose `proposal.md` contains "Imported from `<path>`" (`grep -lF "<path>" openspec/changes/*/proposal.md`; archived changes are not matched) is resumed instead of re-imported.

### Constitution
- `technical_constitution.md` / `RULES.md` (written by `/constitute`) stay the single source of truth; the schemas read them, they are not copied into OpenSpec.
- Design documents compliance (deviations need a reason and go under User Review Required), plan review treats unflagged violations as Critical, apply stops on a design-vs-constitution conflict, and the code review prompt includes the constitution.
- Proposal and clarification don't read it — they stay technology-agnostic.
- `config.yaml` `context` carries a few top non-negotiables plus a pointer to the file.

### Self-Correcting, Zero Gates
- Fix review findings immediately; escalate only product decisions the user must make, or loops that hit their limit (2 for clarification, 3 for everything else).
- Don't archive — that happens after merge.

## Pipeline

0. **Preflight** — `openspec --version`; `openspec init --tools none` if there is no `openspec/`; `openspec schemas --json` lists both agentic schemas (else copy from `~/.local/share/openspec/schemas/` or ask the user to run `install-workflows.sh`).
1. **Resolve the change** — resume a named/matching change (`openspec list --json`); or, given a spec file, import it (`openspec new change <slug> --schema agentic-sdlc`, then the import sub-agent writes `proposal.md`); or classify and run `openspec new change <id> --schema <agentic-sdlc|agentic-lite>`. Announce the schema and why.
2. **Planning loop** — repeat `openspec status --change <id> --json` → dispatch the first `ready` artifact → until `isPlanningComplete`:
   - `proposal`, `specs`, `design`, `tasks`: one authoring sub-agent each.
   - `clarification`, `plan-review`: review round → orchestrator decides open questions → fix sub-agent → fresh review round, until APPROVED.
3. **Apply: implementation + Gates** — sub-agent follows `openspec instructions apply --change <id>` up to the Verification group, ticks `tasks.md`, writes `reviews/gates.md`. Conflicts with proposal/specs/design/constitution go back through the matching gate.
4. **Apply: Verification tasks** — one fresh sub-agent per task and round, ticking only on PASS:
   - Code review (against design, specs and the constitution) → `reviews/code-review.md`
   - Security review (ASVS 5.0 L2) → `reviews/security-review.md`, or waiver → `reviews/security-waiver.md`
   - Delta QA (`/opsx:verify` + `/quality`: every spec scenario exercised by a test, what code review didn't check) → `reviews/qa.md`
   - `openspec validate <id> --strict`
   - Failing report → fix sub-agent → fresh review, max 3 rounds per task.
5. **Summarize** — confirm all tasks are ticked; report change id, schema, skipped stages, security status, files, next steps (`/commit`, then `openspec archive <id>` after merge).

## Quick Checks

When running OpenSpec autopilot, verify:
- [ ] OpenSpec CLI present and both agentic schemas resolvable
- [ ] Schema choice announced with a reason (lite for explicit briefs, sdlc for product work and imported specs)
- [ ] Imported specs were transcribed (not rewritten), with a provenance block; the source file is unchanged
- [ ] Every skipped artifact was reported `done` or `skipped` by `openspec status`
- [ ] Every stage and review round ran in its own sub-agent (or inline fallback was noted)
- [ ] Sub-agent prompts pointed at `openspec instructions ...` rather than restating rules
- [ ] `clarification.md` / `plan-review.md` exist only with APPROVED verdicts; failed rounds are in `reviews/`
- [ ] Proposal stayed technology-agnostic; capability mapping happened in specs; impact landed in design
- [ ] Every acceptance criterion maps to a scenario, and every scenario to a test
- [ ] Design's Constitution Compliance is filled; plan review and code review checked it; deviations are flagged with reasons
- [ ] Apply ran the full gate set once (`reviews/gates.md`); later stages verified deltas
- [ ] Security reviewed or waived with the surfaces named
- [ ] `tasks.md` ends with Gates and Verification groups; security task matches the Security Surface and the diff
- [ ] Code review, security and QA reports end in PASS (or PASS WITH COMMENTS), and only then were their boxes ticked
- [ ] `openspec validate <id> --strict` is clean
- [ ] All tasks ticked (`progress.remaining` is 0)
- [ ] The change was NOT archived
