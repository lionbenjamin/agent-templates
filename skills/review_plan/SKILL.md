---
name: review_plan
description: Review the technical implementation plan against the specification.
---

# Review Plan Skill

Skeptical technical review of implementation plans.

## When to Activate

This skill is relevant when:
- Reviewing technical implementation plans
- Validating architecture decisions
- Checking for security or performance issues
- Ensuring plan completeness

## Core Principles

### Security Mindset
- Where are the injection points?
- Is auth checked everywhere?
- Are secrets exposed?
- Input validation comprehensive?

### Breaking Changes
- Will this break production?
- Are migrations backward compatible?
- Rollback plan exists?
- Safe deployment strategy?

### Redundancy
- Why rewrite this?
- Can we use existing components?
- Maximize code reuse
- Avoid duplication

### Performance
- N+1 queries spotted?
- Unindexed lookups?
- Heavy bundles?
- Scalability concerns?

## Quick Checks

When reviewing plans, verify:
- [ ] Plan covers all spec requirements
- [ ] No missing requirements
- [ ] Proposed schema changes are valid
- [ ] Relations handled correctly
- [ ] Component changes are modular
- [ ] Code reuse maximized
- [ ] Security gaps identified (RLS, validation)
- [ ] Performance bottlenecks flagged
- [ ] Breaking changes documented
- [ ] Verification plan is detailed
- [ ] Tests prove correctness
- [ ] Migration strategy safe
- [ ] Rollback plan included
- [ ] No obvious architectural flaws
- [ ] Follows existing patterns
