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
   - **Structure** (TDD — tests paired with implementation in each phase):
     - **Phase 1: Foundation (Dependencies, DB, Types)**
     - **Phase 2: Core Logic** — write tests first, then implement to pass
     - **Phase 3: UI/Frontend** — write component tests first, then implement
     - **Phase 4: Integration & Wiring** — write integration tests first, then wire
     - **Phase 5: Refactor & Polish** — refactor while all tests stay green
   - **TDD Rule**: Within each phase, test tasks come before implementation tasks:
     - BAD: "Implement Auth" then "Add auth tests"
     - GOOD:
       - [ ] Write tests for `signIn` and `signOut` in `auth.test.ts`
       - [ ] Implement `signIn` and `signOut` in `auth.ts` to pass tests
       - [ ] Write tests for Login Form component
       - [ ] Build Login Form UI to pass tests

5. **Review**:
   - Verify that completing all tasks equals completing the feature.
   - Verify that every implementation task has a preceding test task in the same phase.
   - Ensure no "Verification & Tests" phase is dumped at the end — tests must be interleaved.

6. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/tasks/<feature-slug>-tasks.md"]`.
   - Message: "I have created the task breakdown. Please review before implementation."

7. **Finalize**:
   - **Output**: "Tasks have been populated in `docs/<version>/tasks/<feature-slug>-tasks.md` based on the plan. You can now run `/implement` to start working on the first task."

## Output Format

```markdown
# [Feature Name] Tasks

## Phase 1: Foundation (Dependencies, DB, Types)
- [ ] [Schema/type/dependency task]
- [ ] [Migration task]

## Phase 2: Core Logic
- [ ] Write tests for [service A] in `service-a.test.ts`
- [ ] Implement [service A] in `service-a.ts` to pass tests
- [ ] [P] Write tests for [service B] in `service-b.test.ts`
- [ ] [P] Implement [service B] in `service-b.ts` to pass tests

## Phase 3: UI/Frontend
- [ ] Write component tests for [component X]
- [ ] Build [component X] to pass tests

## Phase 4: Integration & Wiring
- [ ] Write integration tests for [feature flow]
- [ ] Wire [components/services] together to pass integration tests

## Phase 5: Refactor & Polish
- [ ] Refactor [area] — all tests must stay green
- [ ] Run full test suite: `npm test`
- [ ] Manual verification checklist
```

**Task Markers:**
- `[P]` — Can run in parallel with other `[P]` tasks
- `[B]` — Blocking; dependencies must complete first
