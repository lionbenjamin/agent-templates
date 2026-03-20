---
name: autopilot
description: Autonomous pipeline — specify, clarify, plan, review, tasks, implement, code review, QA. No manual gates. Skips stages already completed.
---

# Autopilot Skill

Run the full idea-to-implementation pipeline autonomously, skipping stages already completed, and self-correcting at each review stage.

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

### Smart Skip
- Check what's already been done before starting each stage.
- Spec exists? Skip `/specify`. Spec + clarification record exists? Skip `/clarify`. Plan exists? Skip `/plan`. Etc.
- A spec file alone is NOT enough to skip clarification — the clarification pass must have been explicitly recorded.
- Announce which stages are skipped and why.

### Self-Correcting
- When a review finds issues, fix them immediately — don't stop and ask.
- Loop reviews up to the max iteration limit. Escalate to user only if ambiguous or product-level.

### Plan Is the Contract
- Always plan before coding. Never jump straight to implementation.
- Fix the plan when the review says so, then proceed.

### Quality Without Gatekeeping
- Every stage gets reviewed. No shortcuts.
- Reviews are checkpoints, not stop signs — fix and move on.

### Ship-Ready Output
- The goal is reviewed, working code ready for `/commit`.

## Pipeline

1. `/specify` — draft the product specification *(skip if spec file exists)*
2. `/clarify` — review spec for completeness, self-answer questions, fix gaps *(skip if clarification already recorded in spec)*
3. 🧹 **Clear context** — spec is on disk
4. `/planning` — draft the implementation plan *(skip if plan file exists)*
5. `/review_plan` — critique the plan → fix all issues → re-review until APPROVED *(skip if plan already has APPROVED verdict)*
6. 🧹 **Clear context** — plan is on disk, re-read it to bootstrap
7. `/tasks` — break down into actionable tasks *(skip if tasks file exists)*
8. `/implement` — execute the plan
9. 🧹 **Clear context** — code is on disk, use `git diff` to bootstrap
10. `/code_review` — review the code → fix all issues → re-review until PASS
11. `/quality` — comprehensive QA → fix all issues → re-run until PASS

## Quick Checks

When running autopilot, verify:
- [ ] Feature idea or description exists before starting
- [ ] Skipped stages are announced with clear reason
- [ ] Spec addresses the user's core need and all key user flows
- [ ] Clarification questions are self-answered using judgment (not escalated unless truly ambiguous)
- [ ] Plan addresses all spec requirements
- [ ] Plan review issues are fixed (not just acknowledged)
- [ ] Tasks cover every item in the plan
- [ ] Implementation follows the plan strictly
- [ ] Code review critical/important issues are all resolved
- [ ] QA blocker/critical/major issues are all resolved
- [ ] No review loop exceeded its max iterations
- [ ] Final summary includes spec, plan, tasks paths and all created/modified files
