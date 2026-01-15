---
name: Documentation
description: Maintain accurate, user-centric documentation. Covers README updates, JSDoc/TSDoc comments, and inline code documentation.
---

# Documentation Skill

Keep documentation accurate and helpful.

## When to Activate

This skill is relevant when:
- Adding new functions, components, or APIs
- Making changes that affect usage
- Creating new files or modules
- Completing a feature

## Core Principles

### Documentation Types

**README.md**
- Getting started instructions
- Prerequisites and installation
- Basic usage examples
- Links to detailed docs

**API Documentation (JSDoc/TSDoc)**
```typescript
/**
 * Calculates the total price including tax.
 * 
 * @param items - Array of line items with price and quantity
 * @param taxRate - Tax rate as decimal (e.g., 0.08 for 8%)
 * @returns Total price including tax
 * @throws {InvalidTaxRateError} If taxRate is negative
 * 
 * @example
 * const total = calculateTotal(items, 0.08);
 */
```

**Inline Comments**
- Explain *why*, not *what*
- Document non-obvious business logic
- Explain workarounds or constraints
- Link to relevant issues/tickets

### What to Document

Always document:
- Public functions and APIs
- Complex algorithms or business logic
- Configuration options
- Environment variables
- Non-obvious dependencies

Skip documenting:
- Self-explanatory code
- Implementation details that may change
- Every line of code

### Keep in Sync

When code changes:
- [ ] Update function/component docs
- [ ] Update README if usage changed
- [ ] Update examples if API changed
- [ ] Remove docs for deleted code

### Quality Checks

Good documentation is:
- **Accurate** — matches current behavior
- **Concise** — no unnecessary words
- **Complete** — covers what users need
- **Examples** — show, don't just tell

## Quick Checks

Before completing work, verify:
- [ ] New public APIs are documented
- [ ] README reflects current state
- [ ] Complex logic has explanatory comments
- [ ] Examples are correct and runnable
- [ ] No stale/outdated documentation
