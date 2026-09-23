---
name: autopilot
description: Autonomous pipeline — specify, clarify, plan, review, tasks, implement, code review, security review, QA. Every stage runs in its own sub-agent. No manual gates. Skips stages already completed.
---

# Autopilot Skill

Run the full idea-to-implementation pipeline autonomously, skipping stages already completed, and self-correcting at each review stage. Every stage is delegated to its own sub-agent; the orchestrator routes file paths, findings, and verdicts.

## When to Activate

This skill is relevant when:
- The user wants to go from an idea or feature request to working code in one shot
- The user says "autopilot", "just build it", "end to end", "full pipeline", or "plan through implementation"
- The user wants to skip manual approval gates and let the agent self-correct
- The user has a rough idea and wants the agent to handle everything from specification to QA

## Core Principles

### Zero Manual Gates
- Run the entire pipeline without pausing for user approval.
- Only escalate to the user for critical issues that cannot be autonomously resolved (ambiguous requirements, business decisions, or review loops that hit the max iteration limit).

### Sub-Agent Delegation
- Every stage — and every review/fix iteration — runs in its own fresh sub-agent (Task/Agent tool).
- Sub-agent prompts are self-contained: feature description, artifact file paths, and the command to run. Sub-agents share no context.
- Sub-agents return artifact paths, verdict tokens, and findings — never whole files. The orchestrator keeps only paths, verdicts, and open findings.
- Decisions (skip detection, answering clarification questions, loop control, escalation) stay with the orchestrator.
- Sub-agents that touch or validate code (implement, code review, security review, QA, fix iterations) are instructed to use LSP capabilities (go-to-definition, find-references, rename, diagnostics) when available, falling back to text search otherwise.
- Fresh sub-agent contexts replace the old context-clear checkpoints. If no sub-agent mechanism exists, run stages inline in the same order.

### Smart Skip
- Check what's already been done before starting each stage.
- Spec exists? Skip `/specify`. Spec + clarification record exists? Skip `/clarify`. Plan exists? Skip `/plan`. Etc.
- A spec file alone is NOT enough to skip clarification — the clarification pass must have been explicitly recorded.
- Announce which stages are skipped and why.

### Right-Size the Pipeline
The stage list is a ceiling, not a ritual. Before launching stage 1, classify the change and announce which stages are skipped under these gates (retro evidence: the use-cases removal, 2026-08-30 — 9 sub-agents / ~850k tokens for a −955-line deletion; only plan review and implement changed the outcome):

- **Never write a spec backwards.** If an implementation plan already exists and the brief is explicit (a named removal, a config change, a bugfix with a repro), skip `/specify` AND `/clarify` — the plan review absorbs clarification. A spec derived *from* a plan is ceremony; product-level questions the plan left open go to the plan review's "User Review Required" adjudication instead.
- **Security review is conditional, not standard.** Run `/security_agent` only when the diff (or the plan's file list) touches server surface: `src/app/api/`, auth/session code, security rules, spend/billing paths, input parsing of untrusted data, or a new dependency. For a pure client-side or docs/test change, the orchestrator records a one-line waiver naming the checked surfaces instead of spawning the stage.
- **Tasks collapse into the plan for small changes.** If the plan touches fewer than ~15 files and its "Proposed Changes" section is already ordered and per-file, skip `/tasks` and hand the implementer the plan section directly. A tasks file earns its cost on multi-day or multi-person work, not on a mechanical edit list.
- **Gates run once; later stages verify deltas.** The implementer runs the full gate set (typecheck, lint, full tests, build) and reports verbatim tails. Code review and QA must NOT re-run the full suite by default — they verify the implementer's claims on the diff (scope boundary, dangling references, vacuous tests) and run only checks the earlier stages did not (new-consumer greps, story/docs references, targeted subsets). Re-run the full suite only after a fix iteration changed code.
- **QA is the delta stage.** Its charter is "what did specify-through-code-review structurally not check", never "run everything again and write it down".
- The always-keep set: `/review_plan` (the adversarial pass is the highest-value stage per finding — never cut it) and `/implement`. When in doubt about a gate, run the stage; when the gate clearly applies, skipping is the correct behaviour, not a shortcut.

### Self-Correcting
- When a review finds issues, fix them immediately — don't stop and ask.
- Loop reviews up to the max iteration limit. Escalate to user only if ambiguous or product-level.

### Plan Is the Contract
- Always plan before coding. Never jump straight to implementation.
- Fix the plan when the review says so, then proceed.

### Quality Without Gatekeeping
- Everything that ships gets reviewed — but by the proportionate stage set (see Right-Size the Pipeline), not by every stage unconditionally.
- Reviews are checkpoints, not stop signs — fix and move on.

### Ship-Ready Output
- The goal is reviewed, working code ready for `/commit`.

## Pipeline

Each numbered stage runs in a dedicated sub-agent; review→fix loops spawn a fresh sub-agent per iteration.

1. `/specify` — draft the product specification *(skip if spec file exists; skip if a plan already exists for an explicit brief — never write a spec backwards from a plan)*
2. `/clarify` — review spec for completeness → orchestrator self-answers questions → fix sub-agent applies decisions → re-review until clean *(skip if clarification already recorded in spec; skipped together with `/specify` under the plan-exists gate — plan review absorbs it)*
3. `/planning` — draft the implementation plan *(skip if plan file exists)*
4. `/review_plan` — critique the plan → fix sub-agent → re-review until APPROVED *(skip if plan already has APPROVED verdict; otherwise never cut)*
5. `/tasks` — break down into actionable tasks *(skip if tasks file exists, or if the plan touches <~15 files with an ordered per-file change list — the plan section IS the tasks)*
6. `/implement` — execute the plan; runs the full gate set once (typecheck, lint, full tests, build) and reports verbatim tails
7. `/code_review` — review the diff → fix sub-agent → re-review until PASS *(verifies the implementer's gates on the diff; does not re-run the full suite unless a fix changed code)*
8. `/security_agent` — full ASVS 5.0 security verification (L2, all 17 chapters) → fix Critical/High findings → re-review until PASS *(run only when the diff touches server surface — API routes, auth, rules, spend, untrusted-input parsing, new deps; else record a one-line waiver. Also skip if a security report with PASS verdict exists and no implementation happened this session)*
9. `/quality` — delta QA: only the checks stages 1–8 structurally did not run → fix sub-agent → re-run until PASS

## Quick Checks

When running autopilot, verify:
- [ ] Feature idea or description exists before starting
- [ ] The change was classified up front and the Right-Size gates applied (announced, with reasons)
- [ ] Every stage that ran did so in its own sub-agent (or inline fallback was noted)
- [ ] Sub-agent prompts were self-contained (feature description + artifact paths + command)
- [ ] Skipped stages are announced with clear reason (a gate skip names the gate; a security skip names the checked surfaces)
- [ ] The full gate set ran exactly once on unchanged code — later stages verified deltas, not reruns
- [ ] Spec addresses the user's core need and all key user flows
- [ ] Clarification questions are self-answered using judgment (not escalated unless truly ambiguous)
- [ ] Plan addresses all spec requirements
- [ ] Plan review issues are fixed (not just acknowledged)
- [ ] Tasks cover every item in the plan
- [ ] Implementation follows the plan strictly
- [ ] Code review critical/important issues are all resolved
- [ ] Security review Critical/High findings are all resolved (ASVS PASS verdict)
- [ ] QA blocker/critical/major issues are all resolved
- [ ] No review loop exceeded its max iterations
- [ ] Final summary includes spec, plan, tasks paths and all created/modified files
