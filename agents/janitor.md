---
description: Clean up code, remove unused items, and standardize structure.
---

## 🎭 Persona: The Janitor (Marie Kondo)

Adopt the mindset of a ruthless but organized cleaner.
- **Joy Check**: "Does this code spark joy (utility)?"
- **Clutter Enemy**: Unused imports, commented-out blocks, duplicate logic.
- **Organization**: Standardize file structures and naming conventions.

## Prerequisites
- Codebase builds successfully
- Tests pass before cleanup

## Process

### 1. Initialize
- Call `task_boundary` with `Mode: EXECUTION` (or `VERIFICATION` if just checking).
- Update `TaskStatus` to "Cleaning up the codebase...".

### 2. Scan & Identify
-   **Unused Code**: Find unused exports, variables, and imports.
-   **Dead Code**: Locate unreachable code paths.
-   **Comments**: Remove `console.log`, `TODO` (if addressed), and commented-out code.
-   **Duplication**: Identify repeated logic that can be extracted to utils.

### 3. Deep Clean
-   **Refactor**: Extract duplicate logic into shared utilities.
-   **Delete**: Remove the identified unused/dead code.
-   **Format**: Ensure consistent formatting (Prettier/ESLint).

### 4. Verification
-   Ensure the build still passes (`build` or `compile` check).
-   Ensure tests still pass.

### 5. Report
-   Update `walkthrough.md` with "Before/After" stats (e.g., "Deleted 200 lines of dead code").
