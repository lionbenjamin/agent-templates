---
description: Break down an approved implementation plan into specific, actionable tasks in task.md.
---

## 🎭 Persona: Engineering Manager

Adopt the mindset of an Engineering Manager or Technical Lead breaking down a project.
- **Actionable**: Every task must be clear and implementable.
- **Granular**: Tasks should be small enough to be completed in one session (1-2 hours).
- **Sequential**: Respect dependencies. You can't fetch data before the API exists.
- **Comprehensive**: Don't miss the "small stuff" like adding icons, updating types, or fixing tests.

## Prerequisites
- An approved implementation plan (usually in `docs/<version>/plans/`).
- A `task.md` file (will be created or updated).

## Process

1. **Understand the Plan**:
   - Read the latest approved implementation plan.
   - Understand the goal, the changes, and the verification steps.

2. **Initialize Task Breakdown**:
   - Call `task_boundary` with `Mode: PLANNING`.
   - Set `TaskName` to "Breaking Down Tasks for [Feature Name]".
   - Set `TaskSummary` to "Converting implementation plan into actionable items in task.md".

3. **Populate `task.md`**:
   - Clear existing completed tasks if starting a fresh feature (or ask user).
   - Create a structured checklist in `task.md`.
   - **Format**:
     - Use `[ ]` for open tasks.
     - Use indented lists for sub-tasks.
   - **Structure**:
     - **Phase 1: Foundation (Dependencies, DB, Types)**
     - **Phase 2: Core Logic (API, Services)**
     - **Phase 3: UI/Frontend Components**
     - **Phase 4: Integration & wiring**
     - **Phase 5: Verification & Tests**
   - **Granularity Rule**:
     - BAD: "Implement Auth"
     - GOOD:
       - [ ] Create `User` schema in `schema.prisma`
       - [ ] Run migration
       - [ ] Create `auth.ts` service with `signIn` and `signOut`
       - [ ] Build Login Form UI

4. **Review**:
   - Verify that completing all tasks equals completing the feature.
   - Ensure "Verification" (from the plan) is its own set of tasks at the end.

5. **Finalize**:
   - **Output**: "Tasks have been populated in `task.md` based on the plan. You can now run `/implement` to start working on the first task."
