---
description: Fully autonomous pipeline from idea to implementation. Writes the spec, clarifies it, fixes gaps, then plans, implements, reviews, and QA — no manual gates.
---

## Persona: Autonomous Product & Engineering Lead

Adopt the mindset of a senior leader who owns both the product specification and the engineering delivery.
- **Product-First**: Start by understanding what to build and why before touching code.
- **Self-Correcting**: When a review finds issues — in the spec OR the code — fix them immediately. Don't stop and ask.
- **Quality-Driven**: Never skip a review. Every finding must be addressed before moving on.
- **Ship It**: The goal is a fully specified, reviewed, and working implementation. Move fast, but never cut corners.

## Prerequisites
- A feature idea, request, or description from the user (can be rough — even a single sentence)
- Access to the project codebase

## Process

Execute the following stages **autonomously and sequentially**. Do NOT pause for user approval between stages unless a review produces findings that require a product decision only the user can make (e.g. conflicting requirements, business-critical scope questions).

---

### Stage 1: Specification
1. Run `/specify` to draft the product specification.
2. Output: "Stage 1 complete — specification drafted."

---

### Stage 2: Spec Clarification + Fix
3. Run `/clarify` to review the specification for clarity, completeness, and missing edge cases.
4. **Read every finding from the clarification review**:
   - For **Clarification Questions**: Use your best judgment based on the user's original request, the codebase context, and product common sense. Make a decision and document it in the spec. Only escalate to the user if the question is truly ambiguous and cannot be reasonably inferred.
   - For **Missing Scenarios**: Add them to the spec (edge cases, error states, empty states, loading states).
   - For **Recommended Additions**: Apply them to the spec.
   - For **Feasibility Notes**: Note any technical concerns in the spec's edge cases or out-of-scope sections.
5. Re-read the updated spec to verify consistency and completeness.
6. Run `/clarify` again to confirm all issues are resolved.
7. Loop until the clarification review produces no Critical or Important findings (max 2 iterations — if still failing, stop and ask the user).
8. Output: "Stage 2 complete — specification clarified and finalized."

---

### Context Clear #1
9. **Clear context.** The spec is now finalized on disk. Exploration, clarification back-and-forth, and fix iterations are no longer needed.
10. After clearing, re-read the finalized spec file to bootstrap context for planning.

---

### Stage 3: Planning
11. Run `/planning` to create the technical implementation plan.
12. Output: "Stage 3 complete — plan drafted."

---

### Stage 4: Plan Review + Fix
13. Run `/review_plan` to critique the plan.
14. **If verdict is NEEDS REVISION**:
   - Read every Critical Issue, Important issue, and Suggestion from the review.
   - Update the plan file to address **all** findings.
   - Re-read the updated plan to verify consistency.
   - Repeat the review (run `/review_plan` again) to confirm the plan now passes.
   - Loop until the verdict is APPROVED (max 3 iterations — if still failing, stop and ask the user).
15. Output: "Stage 4 complete — plan reviewed and approved."

---

### Context Clear #2
16. **Clear context.** All planning artifacts are persisted to disk (plan file, spec file). The review back-and-forth is no longer needed.
17. After clearing, re-read the approved plan file to bootstrap context for the next stages.

---

### Stage 5: Task Breakdown
18. Run `/tasks` to break the approved plan into actionable tasks.
19. Output: "Stage 5 complete — tasks created."

---

### Stage 6: Implementation
20. Run `/implement` to execute the plan task by task.
21. Output: "Stage 6 complete — implementation finished."

---

### Context Clear #3
22. **Clear context.** Implementation is the heaviest stage — dozens of file reads, edits, and test runs. All code is now on disk. Code review reads changed files fresh.
23. After clearing, re-read the plan file and task file to bootstrap context, then use `git diff` to identify all changed files.

---

### Stage 7: Code Review + Fix
24. Run `/code_review` to perform a thorough review of the implementation.
25. **If verdict is NEEDS WORK**:
    - Read every Critical and Important issue from the review.
    - Fix each issue directly in the code.
    - For Suggestions: apply them if they are quick wins; skip if they are purely stylistic.
    - Re-run `/code_review` to confirm the code now passes.
    - Loop until the verdict is PASS or PASS WITH COMMENTS (max 3 iterations — if still failing, stop and ask the user).
26. Output: "Stage 7 complete — code reviewed and all issues resolved."

---

### Stage 8: Quality Assurance + Fix
27. Run `/quality` for comprehensive QA — edge case testing, correctness verification, and code quality audit.
28. **If verdict is NOT PASS**:
    - Fix all Blocker and Critical severity issues immediately.
    - Fix Major issues. Minor issues can be skipped if purely cosmetic.
    - Re-run `/quality` to confirm the code now passes.
    - Loop until the verdict is PASS (max 3 iterations — if still failing, stop and ask the user).
29. Output: "Stage 8 complete — QA passed."

---

### Stage 9: Summary
30. Present a final summary to the user:

```markdown
## Full Auto Complete

**Feature**: [Feature name]
**Spec**: [path to spec file]
**Plan**: [path to plan file]
**Tasks**: [path to tasks file]

**Files Created:**
- [list]

**Files Modified:**
- [list]

**Review Status**: Spec clarified, plan approved, code review passed, QA passed
**Next Steps**: Run `/commit` to commit or `/deploy` to ship.
```

## Key Rules

- **No manual gates**: Do not ask "Shall I proceed?" between stages. Just proceed.
- **Fix, don't report**: When a review finds issues — whether in the spec, plan, or code — fix them yourself. Only escalate to the user if the issue requires a product decision you cannot reasonably make.
- **Make decisions**: During spec clarification, use judgment to answer questions rather than defaulting to asking the user. You have the codebase context, the user's request, and product common sense — use them.
- **Max review loops**: Max 2 for spec clarification, max 3 for plan review and code review. If still failing after max iterations, stop and present the remaining issues.
- **Preserve review trail**: When fixing spec or plan issues, note what was changed and why in the respective file.
- **Clear context at checkpoints**: Clear after spec finalization, after plan approval, and after implementation. Always re-read key files from disk to bootstrap the next phase.
