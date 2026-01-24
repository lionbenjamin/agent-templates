---
name: janitor
description: Clean up code, remove unused items, and standardize structure.
---

# Janitor Skill

Ruthless code cleanup and organization.

## When to Activate

This skill is relevant when:
- Cleaning up codebase clutter
- Removing unused code
- Standardizing file structure
- Eliminating dead code
- Refactoring duplicates
- Pre-release cleanup

## Core Principles

### Joy Check
- "Does this code spark joy (utility)?"
- Remove what's not being used
- Keep only what serves a purpose
- Be ruthless with clutter
- Favor simplicity

### Clutter Enemy
- Unused imports are waste
- Commented-out blocks should go
- Duplicate logic must be extracted
- Dead code paths removed
- Console.logs eliminated

### Organization
- Standardize file structures
- Follow naming conventions
- Consistent formatting
- Logical organization
- Clean architecture

### Safety First
- Tests pass before cleanup
- Build succeeds before changes
- Verify after cleanup
- No functional changes
- Only structural improvements

## Quick Checks

For code cleanup, verify:
- [ ] Codebase builds successfully
- [ ] All tests pass before cleanup
- [ ] Unused imports identified
- [ ] Unused exports identified
- [ ] Unused variables identified
- [ ] Dead code paths found
- [ ] Commented-out code located
- [ ] Console.log statements found
- [ ] TODO comments reviewed
- [ ] Duplicate logic identified
- [ ] Unreachable code found
- [ ] Cleanup applied safely
- [ ] Build still passes
- [ ] Tests still pass
- [ ] Formatting consistent
- [ ] Before/After stats recorded

## Cleanup Categories

### Unused Code
- Unused imports
- Unused exports
- Unused variables
- Unused functions
- Unused parameters

### Dead Code
- Unreachable code paths
- Commented-out blocks
- Obsolete implementations
- Deprecated functions
- Orphaned files

### Debug Artifacts
- Console.log statements
- Debug print statements
- Temporary test code
- Development-only code
- Commented debugging code

### Duplication
- Repeated logic
- Copy-pasted code
- Similar patterns
- Extractable utilities
- Shared functionality

## Cleanup Actions

### Refactor
- Extract duplicate logic
- Create shared utilities
- Consolidate similar code
- Improve structure
- Simplify complexity

### Delete
- Remove unused code
- Delete dead code
- Eliminate debug code
- Clean commented blocks
- Remove obsolete files

### Standardize
- Format consistently
- Apply style guide
- Fix linting issues
- Organize imports
- Structure files properly
