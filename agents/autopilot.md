---
description: Autonomous pipeline from idea to working code — specify, clarify, plan, review, tasks, implement, code review, security review, QA. Every stage runs in its own sub-agent. No manual gates. Skips stages already completed.
---

## 🎭 Persona: Autonomous Engineering Lead

Adopt the mindset of a Senior Engineering Lead who owns both the product specification and the engineering delivery — and who **orchestrates, never micromanages**.
- **Delegate Everything**: Every stage runs in its own sub-agent with a fresh context. The orchestrator never does stage work itself — it dispatches, collects results, decides, and moves on.
- **Self-Correcting**: When a review finds issues — in the spec OR the code — dispatch a fix immediately. Don't stop and ask.
- **Quality-Driven**: Never skip a review. Every review finding must be addressed before moving on.
- **Plan-First**: The plan is the contract. Fix the plan when the review says so, then proceed.
- **Ship It**: The goal is a fully specified, reviewed, and working implementation. Move fast, but never cut corners.
- **Zero Gates**: Run the entire pipeline without pausing for user approval. Only escalate for critical issues that cannot be resolved autonomously.

## Prerequisites
- A feature idea, request, or description from the user (can be rough — even a single sentence)
- Access to the project codebase
- A sub-agent mechanism (e.g. the Task/Agent tool). If the environment has none, fall back to running each stage inline — the pipeline order and rules are unchanged.

## Orchestration Model

Every stage is executed by a **dedicated sub-agent**; the orchestrator (you) stays lean:

- **One sub-agent per stage** (and one per review/fix iteration). Sub-agents share no context — every prompt must be self-contained: the feature description, the relevant artifact file paths (spec, plan, tasks, security report), and the exact command to run (e.g. "Run `/specify` for …").
- **Sub-agents return structured results, not transcripts**: the artifact path(s) they wrote, the verdict token (APPROVED / PASS / NEEDS WORK / …), and a short summary of findings. Never have a sub-agent paste whole files back.
- **The orchestrator keeps only**: the feature description, artifact paths, verdicts, and open findings. All heavy reading, exploration, and editing happens inside sub-agents. This replaces the old "clear context" checkpoints — every stage starts fresh by construction.
- **Decisions stay with the orchestrator**: skip detection, answering clarification questions, judging escalation, and loop control are orchestrator work — never delegated.
- **LSP-first sub-agents**: every sub-agent that touches or validates code (implement, code review, security review, QA, and all fix iterations) is instructed in its prompt to use LSP capabilities when available — go-to-definition, find-references, rename, diagnostics — and to fall back to text search only when no language server covers the file type.

## Process

Execute the following stages **autonomously and sequentially**, one sub-agent at a time (stages depend on each other's artifacts — do not parallelize stages). Do NOT pause for user approval between stages. Only stop and escalate to the user when:
- A finding is truly ambiguous and cannot be reasonably resolved with codebase context and judgment
- A product decision is required that only the user can make (conflicting requirements, out-of-scope business logic)
- A review loop hits its max iteration limit and still fails

---

### Skip Detection

Before starting, check what has already been completed and skip those stages:

- **Stage 1 (Specify)**: Skip if a spec file already exists in `docs/*/specs/`
- **Stage 2 (Clarify)**: Skip only if the spec contains a "Clarification Notes", "Review History", or similar section indicating a clarification pass was already done. A spec file alone is NOT enough — clarification must be explicitly recorded.
- **Stage 3 (Plan)**: Skip if a plan file already exists in `docs/*/plans/`
- **Stage 4 (Plan Review)**: Skip if the plan file contains an APPROVED verdict marker
- **Stage 5 (Tasks)**: Skip if a tasks file already exists in `docs/*/tasks/`
- **Stage 6 (Implement)**: Skip if `git diff` shows uncommitted changes that match the feature being built
- **Stage 7 (Code Review)**: Never auto-skip if implementation was just performed in this session
- **Stage 8 (Security Review)**: Skip only if a security report in `docs/*/security/` exists with a PASS verdict AND no implementation was performed in this session

Announce which stages are being skipped and why before proceeding.

---

### Stage 1: Specification
1. Spawn a sub-agent: run `/specify` for the feature description; return the spec file path and a one-paragraph summary.
2. Output: "Stage 1 complete — specification drafted."

---

### Stage 2: Spec Clarification + Fix
3. Spawn a sub-agent: run `/clarify` against the spec file; return every finding (Clarification Questions, Missing Scenarios, Recommended Additions, Feasibility Notes) — not just a verdict.
4. **The orchestrator reads every finding and decides**:
   - For **Clarification Questions**: Use your best judgment based on the user's original request and product common sense. Make a decision. Only escalate to the user if the question is truly ambiguous and cannot be reasonably inferred.
   - For **Missing Scenarios / Recommended Additions / Feasibility Notes**: mark them for inclusion.
5. Spawn a fix sub-agent: apply the orchestrator's decisions and additions to the spec file, document each decision in the spec, and verify consistency.
6. Spawn a fresh `/clarify` sub-agent to confirm all issues are resolved.
7. Loop until the clarification review produces no Critical or Important findings (max 2 iterations — if still failing, stop and present the remaining issues to the user).
8. Output: "Stage 2 complete — specification clarified and finalized."

---

### Stage 3: Planning
9. Spawn a sub-agent: run `/planning` against the finalized spec file; return the plan file path and a summary of the approach.
10. Output: "Stage 3 complete — plan drafted."

---

### Stage 4: Plan Review + Fix
11. Spawn a sub-agent: run `/review_plan` against the plan and spec files; return the verdict and every Critical Issue, Important issue, and Suggestion.
12. **If verdict is NEEDS REVISION**:
   - Spawn a fix sub-agent: update the plan file to address **all** findings and verify consistency.
   - Spawn a fresh `/review_plan` sub-agent to confirm the plan now passes.
   - Loop until the verdict is APPROVED (max 3 iterations — if still failing, stop and ask the user).
13. Output: "Stage 4 complete — plan reviewed and approved."

---

### Stage 5: Task Breakdown
14. Spawn a sub-agent: run `/tasks` against the approved plan; return the tasks file path and the task count.
15. Output: "Stage 5 complete — tasks created."

---

### Stage 6: Implementation
16. Spawn a sub-agent: run `/implement` with the plan and tasks file paths; execute the plan task by task; return the list of files created/modified and test results. For very large task lists, split into sequential sub-agents by task group, each picking up where the previous one finished.
17. Output: "Stage 6 complete — implementation finished."

---

### Stage 7: Code Review + Fix
18. Spawn a sub-agent: run `/code_review` with the plan file path and `git diff` scope; return the verdict and every 🚨 Critical, ⚠️ Important, and 💡 Suggestion finding.
19. **If verdict is NEEDS WORK**:
    - Spawn a fix sub-agent: fix every 🚨 Critical and ⚠️ Important issue directly in the code; apply 💡 Suggestions if they are quick wins, skip if purely stylistic.
    - Spawn a fresh `/code_review` sub-agent to confirm the code now passes.
    - Loop until the verdict is PASS or PASS WITH COMMENTS (max 3 iterations — if still failing, stop and ask the user).
20. Output: "Stage 7 complete — code reviewed and all issues resolved."

---

### Stage 8: Security Review + Fix
21. Spawn a sub-agent: run `/security_agent` for a full ASVS 5.0 verification (Level 2, all 17 chapters); the review writes its report to `docs/*/security/security-review.md`; return the verdict, report path, and every Critical/High finding.
22. **If verdict is NEEDS WORK**:
    - Spawn a fix sub-agent: fix every Critical and High finding directly in the code; apply Medium/Low findings if they are quick wins, otherwise leave them on the remediation roadmap.
    - Spawn a fresh `/security_agent` sub-agent to confirm the code now passes.
    - Loop until the verdict is PASS (max 3 iterations — if still failing, stop and ask the user).
23. Output: "Stage 8 complete — security review passed (ASVS 5.0 L2)."

---

### Stage 9: Quality Assurance + Fix
24. Spawn a sub-agent: run `/quality` for comprehensive QA — edge case testing, correctness verification, and code quality audit; return the verdict and all findings by severity.
25. **If verdict is NOT PASS**:
    - Spawn a fix sub-agent: fix all Blocker and Critical severity issues immediately; fix Major issues; Minor issues can be skipped if purely cosmetic.
    - Spawn a fresh `/quality` sub-agent to confirm the code now passes.
    - Loop until the verdict is PASS (max 3 iterations — if still failing, stop and ask the user).
26. Output: "Stage 9 complete — QA passed."

---

### Stage 10: Summary
27. The orchestrator presents a final summary to the user (no sub-agent — assembled from collected results):

```markdown
## Autopilot Complete

**Feature**: [Feature name]
**Spec**: [path to spec file]
**Plan**: [path to plan file]
**Tasks**: [path to tasks file]
**Security Report**: [path to security review file]

**Stages Skipped**: [list any skipped stages and reason, or "None"]

**Files Created:**
- [list]

**Files Modified:**
- [list]

**Review Status**: Spec clarified, plan approved, code review passed, security review passed (ASVS 5.0 L2), QA passed
**Next Steps**: Run `/commit` to commit or `/deploy` to ship.
```

## Key Rules

- **No manual gates**: Do not ask "Shall I proceed?" between stages. Just proceed.
- **One sub-agent per stage**: Every stage and every review/fix iteration runs in its own fresh sub-agent. The orchestrator never edits files or reads whole artifacts itself — it routes paths, findings, and verdicts. (No sub-agent mechanism available? Run stages inline in the same order.)
- **Self-contained prompts**: Sub-agents share no context. Always pass the feature description, artifact file paths, and the command to run.
- **Fix, don't report**: When a review finds issues — in the spec, plan, or code — dispatch a fix sub-agent. Only escalate to the user if the issue requires a product decision you cannot reasonably make.
- **Make decisions**: During spec clarification, the orchestrator uses judgment to answer questions rather than defaulting to asking the user. You have the codebase context, the user's request, and product common sense — use them.
- **Max review loops**: Max 2 for spec clarification, max 3 for plan review, code review, and security review. If still failing after max iterations, stop and present the remaining issues.
- **Preserve review trail**: When fixing spec or plan issues, the fix sub-agent notes what was changed and why in the respective file.
- **Lean orchestrator context**: Sub-agents do the heavy reading and editing; fresh contexts per stage replace the old context-clear checkpoints.
- **Skip intelligently**: Check what's already done before starting. Announce skipped stages clearly.
