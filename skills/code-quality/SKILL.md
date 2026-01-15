---
name: Code Quality
description: Enforce code quality patterns during development. Covers naming, single responsibility, error handling, type safety, and common anti-patterns.
---

# Code Quality Skill

Apply these quality principles when writing or reviewing code.

## When to Activate

This skill is relevant when:
- Writing new functions, classes, or components
- Refactoring existing code
- Reviewing pull requests
- Debugging issues

## Core Principles

### Naming
- Functions: verb + noun (`getUserById`, `calculateTotal`)
- Booleans: `is`, `has`, `can`, `should` prefix
- Constants: SCREAMING_SNAKE_CASE
- Be specific: `userCount` not `count`, `isLoading` not `loading`

### Single Responsibility
- Each function does one thing well
- Functions under 30 lines (prefer under 15)
- Classes/modules have clear, focused purpose
- If you need "and" to describe it, split it

### Error Handling
- Handle errors at appropriate boundaries
- Provide meaningful error messages
- Never swallow exceptions silently
- Use typed errors in TypeScript (`Result<T, E>` pattern)

### Type Safety (TypeScript)
- **Never use `as any`** - find the correct type
- Avoid `any` - use `unknown` and narrow
- Prefer interfaces over type aliases for objects
- Use discriminated unions for state

### React Patterns
- `useEffect` dependencies must be complete
- Use `useRef` for callbacks in dependency arrays
- Avoid prop drilling - use context or composition
- Memoize expensive computations

### Anti-Patterns to Avoid
- Magic numbers/strings (use named constants)
- Deep nesting (extract to functions)
- Boolean parameters (use options object)
- Commented-out code (delete it)
- `console.log` in production code

## Quick Checks

When writing code, verify:
- [ ] Clear, descriptive names throughout
- [ ] No functions over 30 lines
- [ ] Errors handled appropriately
- [ ] No `any` or `as any` types
- [ ] No unused imports or variables
- [ ] No `console.log` statements left behind
