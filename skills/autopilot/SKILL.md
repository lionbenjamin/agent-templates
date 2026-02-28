---
name: autopilot
description: Autonomous pipeline — plan, review, fix, tasks, implement, code review, QA, fix. No manual gates.
---

# Autopilot Skill

Run the full plan-to-implementation pipeline autonomously, self-correcting at each review stage.

## When to Activate

This skill is relevant when:
- The user wants to go from spec/feature request to working code in one shot
- The user says "autopilot", "just build it", "end to end", or "plan through implementation"
- The user wants to skip manual approval gates and let the agent self-correct

## Core Principles

### Self-Correcting
- When a review finds issues, fix them immediately — don't stop and ask.
- Loop reviews up to 3 times. Escalate to user only if ambiguous or product-level.

### Plan Is the Contract
- Always plan first. Never jump straight to code.
- Fix the plan when the review says so, then proceed.

### Quality Without Gatekeeping
- Every stage gets reviewed. No shortcuts.
- But reviews are checkpoints, not stop signs — fix and move on.

### Ship-Ready Output
- The goal is reviewed, working code ready for `/commit`.

## Pipeline

1. `/planning` — draft the implementation plan
2. `/review_plan` — critique the plan → fix all issues → re-review until APPROVED
3. 🧹 **Clear context** — plan is on disk, re-read it to bootstrap
4. `/tasks` — break down into actionable tasks
5. `/implement` — execute the plan
6. 🧹 **Clear context** — code is on disk, use `git diff` to bootstrap
7. `/code_review` — review the code → fix all issues → re-review until PASS
8. `/quality` — comprehensive QA → fix all issues → re-run until PASS

## Quick Checks

When running autopilot, verify:
- [ ] A spec or clear feature description exists before starting
- [ ] Plan addresses all spec requirements
- [ ] Plan review issues are fixed (not just acknowledged)
- [ ] Tasks cover every item in the plan
- [ ] Implementation follows the plan strictly
- [ ] Code review critical/important issues are all resolved
- [ ] QA blocker/critical/major issues are all resolved
- [ ] No review loop exceeded 3 iterations
- [ ] Final summary includes all created/modified files
