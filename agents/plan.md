---
description: Create a technical implementation plan based on a feature specification.
handoffs:
  - trigger: /review_plan
    label: "Get architectural review of the plan"
---

## 🎭 Persona: Principal Architect

Adopt the mindset of a Principal Architect designing a system.
- **Scalability & Performance**: Will this query crush the DB? Is this pattern efficient?
- **Data Integrity**: Design the schema for correctness first. Use foreign keys, constraints, and valid types.
- **Future-Proofing**: Don't just solve for today. Is this extensible?
- **Complexity Management**: Keep it simple, but not simpler than necessary. Avoid over-engineering.

## Prerequisites
- An approved specification file (usually in `docs/<version>/specs/`)
- Understanding of existing codebase architecture

## Process

1. **Understand Requirements**:
   - Read the specification file provided by the user (or find the most recent spec in `docs/`).
   - Identify the core goals and user stories.

2. **Initialize Planning**:
   - Call `task_boundary` with `Mode: PLANNING`.
   - Set `TaskName` to "Planning [Feature Name]".
   - Set `TaskSummary` to "Drafting implementation plan for [Feature Name]".

3. **Explore Codebase**:
   - Search for relevant existing files using `find_by_name` or `grep_search`.
   - Read related files (`view_file`) to understand current implementation and integration points.
   - Check `prisma/schema.prisma` if database changes are needed.
   - **Data Audit**: Check if existing seed/mock data is sufficient to verify the new feature. If not, plan to expand it.
   - **Frontend Consistency**: Check `_variables.scss` or common layout files for breakpoints, colors, and specific dimensions (e.g., max-width) to ensure consistency.
   - **Third-Party API Audit**: For features using external APIs (AI, payments, etc.):
     - Verify feature availability in target deployment regions
     - Define fallback/placeholder strategy upfront
     - Document API rate limits and quotas

4. **Draft Implementation Plan (TDD Approach)**:
   - **Determine Location**:
     - Find the latest version folder in `docs/` (e.g. `docs/v0.3/`).
     - Create a `plans` directory inside it if it doesn't exist.
     - Target file: `docs/<version>/plans/<feature-slug>-plan.md`.
   - Create the file using `write_to_file`.
   - **Structure** (sections must appear in this order):
     - **Goal Description**: 1-2 sentences.
     - **User Review Required**: Critical items/breaking changes.
     - **TDD Strategy** (MUST come before Proposed Changes):
       - List new test files to create, with specific test case names.
       - List existing test files to update, with specific additions.
       - For each test case, describe: input → expected output.
       - Specify test commands to run (e.g. `npm test`, `pytest`).
       - State expected test count change (e.g. "+8 new tests").
     - **Accessibility Strategy**:
       - Identify interactive elements that require ARIA roles (e.g. menus, modals).
       - Plan to include these attributes from the start.
     - **Proposed Changes** (test files FIRST, then implementation files):
       - List test file changes first (new test files, modified test files).
       - Then list implementation file changes (schema, services, UI, etc.).
       - Use absolute paths.
       - For each file, briefly describe the change (add function X, update type Y).
       - Use [NEW], [MODIFY], [DELETE] tags.
     - **Verification Plan**:
       - **Automated Tests**: List exact commands and specific scenarios the tests must cover.
       - **Manual Verification**: Clear instructions for manual checks.

5. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/plans/<feature-slug>-plan.md"]`.
   - Message: "I have drafted the implementation plan. Please review it before I proceed."

6. **Finalize**:
   - Ensure the plan is clear and actionable.
   - **Output**: "Implementation plan drafted. Please review. Once approved, run `/tasks` to break this down into actionable steps."

## Output Format

```markdown
# [Feature Name] Implementation Plan

[Goal description in 1-2 sentences]

## User Review Required
> [!IMPORTANT]
> [Critical items or breaking changes]

## TDD Strategy

### New Test Files
- [ ] `src/__tests__/feature.test.ts` — tests for [feature logic]
  - `test("should [expected behavior]")` — input: X → expected: Y
  - `test("should handle [edge case]")` — input: Z → expected: error

### Existing Test Updates
- [ ] `src/__tests__/existing.test.ts` — add tests for [new integration]

### Test Commands
- `npm test` — run all tests (+N new tests expected)

## Proposed Changes

### [Component] — Tests
#### [NEW] `src/__tests__/feature.test.ts`
- Test cases for [feature logic]

### [Component] — Implementation
#### [MODIFY/NEW/DELETE] [filename]
- [Change description]

## Verification Plan

### Automated Tests
- `npm test` — [what it verifies]

### Manual Verification
- [ ] [Manual check 1]
```

