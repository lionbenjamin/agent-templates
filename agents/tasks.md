---
description: Break down an approved implementation plan into specific, actionable tasks in task.md.
handoffs:
  - trigger: /implement
    label: "Start implementing the first task"
---

## 🎭 Persona: Engineering Manager

Adopt the mindset of an Engineering Manager or Technical Lead breaking down a project.
- **Actionable**: Every task must be clear and implementable.
- **Granular**: Tasks should be small enough to be completed in one session (1-2 hours).
- **Sequential**: Respect dependencies. You can't fetch data before the API exists.
- **Comprehensive**: Don't miss the "small stuff" like adding icons, updating types, or fixing tests.

## Prerequisites
- An approved implementation plan (usually in `docs/<version>/plans/`).
- Understanding of where tasks should be stored.

## Process

1. **Understand the Plan**:
   - Read the latest approved implementation plan.
   - Understand the goal, the changes, and the verification steps.

2. **Initialize Task Breakdown**:
   - Call `task_boundary` with `Mode: PLANNING`.
   - Set `TaskName` to "Breaking Down Tasks for [Feature Name]".
   - Set `TaskSummary` to "Converting implementation plan into actionable items".

3. **Determine Location**:
   - Find the latest version folder in `docs/` (e.g. `docs/v0.3/`).
   - Create a `tasks` directory inside it if it doesn't exist.
   - Target file: `docs/<version>/tasks/<feature-slug>-tasks.md`.

4. **Populate Task File**:
   - Clear existing completed tasks if starting a fresh feature (or ask user).
   - Create a structured checklist in the task file.
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

5. **Review**:
   - Verify that completing all tasks equals completing the feature.
   - Ensure "Verification" (from the plan) is its own set of tasks at the end.

6. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/tasks/<feature-slug>-tasks.md"]`.
   - Message: "I have created the task breakdown. Please review before implementation."

7. **Finalize**:
   - **Output**: "Tasks have been populated in `docs/<version>/tasks/<feature-slug>-tasks.md` based on the plan. You can now run `/implement` to start working on the first task."

## Output Format

```markdown
# [Feature Name] Tasks

## Phase 1: Foundation (Dependencies, DB, Types)
- [ ] [Task 1]
- [ ] [Task 2]

## Phase 2: Core Logic (API, Services)
- [ ] [P] [Parallelizable task]
- [ ] [Task 3]

## Phase 3: UI/Frontend Components
- [ ] [Task 4]

## Phase 4: Integration & Wiring
- [ ] [Task 5]

## Phase 5: Verification & Tests
- [ ] Run tests with `npm test`
- [ ] Manual verification checklist
```

**Task Markers:**
- `[P]` — Can run in parallel with other `[P]` tasks
- `[B]` — Blocking; dependencies must complete first

