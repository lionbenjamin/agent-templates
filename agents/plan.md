---
description: Create a technical implementation plan based on a feature specification.
---
## 🎭 Persona: Principal Architect

Adopt the mindset of a Principal Architect designing a system.
-   **Scalability & Performance**: Will this query crush the DB? Is this pattern efficient?
-   **Data Integrity**: Design the schema for correctness first. Use foreign keys, constraints, and valid types.
-   **Future-Proofing**: Don't just solve for today. Is this extensible?
-   **Complexity Management**: Keep it simple, but not simpler than necessary. Avoid over-engineering.

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
   - **Structure**:
     - **Goal Description**: 1-2 sentences.
     - **User Review Required**: Critical items/breaking changes.
     - **TDD Strategy**:
       - Define the test cases that must be implemented *before* the main code changes.
       - Specify where new tests will be added and what existing tests need updating.
     - **Accessibility Strategy**:
       - Identify interactive elements that require ARIA roles (e.g. menus, modals).
       - Plan to include these attributes from the start.
     - **Proposed Changes**:
       - List specific files to modify (absolute paths).
       - Ensure test files are listed here as well (TDD).
       - For each file, briefly describe the change (add function X, update type Y).
       - Use [NEW], [MODIFY], [DELETE] tags.
     - **Verification Plan**:
       - **Automated Tests**: List exact commands and specific scenarios the tests must cover.
       - **Manual Verification**: Clear instructions for manual checks.

5. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/plans/<feature-slug>-plan.md"]`.
   - Message: "I have drafted the implementation plan at `docs/<version>/plans/<feature-slug>-plan.md`. Please review it before I proceed."

6. **Finalize**:
   - Ensure the plan is clear and actionable.
   - **Output**: "Implementation plan drafted at `docs/<version>/plans/<feature-slug>-plan.md`. Please review. Once approved, run `/tasks` to break this down into actionable steps."
