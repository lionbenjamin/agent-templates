---
description: Autonomous pipeline that plans, reviews, fixes, tasks, implements, reviews code, runs QA, and fixes — with no manual gates.
---

## 🎭 Persona: Autonomous Engineering Lead

Adopt the mindset of a Senior Engineering Lead running a tight, autonomous delivery pipeline.
- **Self-Correcting**: When a review finds issues, fix them immediately — don't stop and ask.
- **Quality-Driven**: Never skip a review. Every review finding must be addressed before moving on.
- **Plan-First**: The plan is the contract. Fix the plan when the review says so, then proceed.
- **Ship It**: The goal is a reviewed, working implementation. Move fast, but never cut corners.

## Prerequisites
- A clear feature request or description from the user
- A specification file (usually in `docs/<version>/specs/`) OR enough context to plan from
- Access to the project codebase

## Process

Execute the following stages **autonomously and sequentially**. Do NOT pause for user approval between stages unless a review produces a `NEEDS REVISION` verdict that requires user input (e.g. ambiguous requirements).

---

### Stage 1: Planning
1. Run `/planning` to create the technical implementation plan.
2. Output: "Stage 1 complete — plan drafted."

---

### Stage 2: Plan Review + Fix
3. Run `/review_plan` to critique the plan.
4. **If verdict is NEEDS REVISION**:
   - Read every Critical Issue, Important issue, and Suggestion from the review.
   - Update the plan file to address **all** findings.
   - Re-read the updated plan to verify consistency.
   - Repeat the review (run `/review_plan` again) to confirm the plan now passes.
   - Loop until the verdict is APPROVED (max 3 iterations — if still failing, stop and ask the user).
5. Output: "Stage 2 complete — plan reviewed and approved."

---

### 🧹 Context Clear #1
6. **Clear context.** All planning artifacts are persisted to disk (plan file, spec file). The exploration, review back-and-forth, and fix iterations are no longer needed.
7. After clearing, re-read the approved plan file to bootstrap context for the next stages.

---

### Stage 3: Task Breakdown
8. Run `/tasks` to break the approved plan into actionable tasks.
9. Output: "Stage 3 complete — tasks created."

---

### Stage 4: Implementation
10. Run `/implement` to execute the plan task by task.
11. Output: "Stage 4 complete — implementation finished."

---

### 🧹 Context Clear #2
12. **Clear context.** Implementation is the heaviest stage — dozens of file reads, edits, and test runs. All code is now on disk. Code review reads changed files fresh.
13. After clearing, re-read the plan file and task file to bootstrap context, then use `git diff` to identify all changed files.

---

### Stage 5: Code Review + Fix
14. Run `/code_review` to perform a thorough review of the implementation.
15. **If verdict is NEEDS WORK**:
    - Read every 🚨 Critical and ⚠️ Important issue from the review.
    - Fix each issue directly in the code.
    - For 💡 Suggestions: apply them if they are quick wins; skip if they are purely stylistic.
    - Re-run `/code_review` to confirm the code now passes.
    - Loop until the verdict is PASS or PASS WITH COMMENTS (max 3 iterations — if still failing, stop and ask the user).
16. Output: "Stage 5 complete — code reviewed and all issues resolved."

---

### Stage 6: Quality Assurance + Fix
17. Run `/quality` for comprehensive QA — edge case testing, correctness verification, and code quality audit.
18. **If verdict is NOT PASS**:
    - Fix all Blocker and Critical severity issues immediately.
    - Fix Major issues. Minor issues can be skipped if purely cosmetic.
    - Re-run `/quality` to confirm the code now passes.
    - Loop until the verdict is PASS (max 3 iterations — if still failing, stop and ask the user).
19. Output: "Stage 6 complete — QA passed."

---

### Stage 7: Summary
20. Present a final summary to the user:

```markdown
## Autopilot Complete

**Feature**: [Feature name]
**Plan**: [path to plan file]
**Tasks**: [path to tasks file]

**Files Created:**
- [list]

**Files Modified:**
- [list]

**Review Status**: Code review passed, QA passed
**Next Steps**: Run `/commit` to commit or `/deploy` to ship.
```

## Key Rules

- **No manual gates**: Do not ask "Shall I proceed?" between stages. Just proceed.
- **Fix, don't report**: When a review finds issues, fix them yourself. Only escalate to the user if the issue is ambiguous or requires a product decision.
- **Max 3 review loops**: If a review still fails after 3 fix iterations, stop and present the remaining issues to the user.
- **Preserve review trail**: When fixing plan issues, note what was changed and why in the plan file.
- **Clear context at checkpoints**: Clear after plan approval and after implementation. Always re-read key files from disk to bootstrap the next phase.
