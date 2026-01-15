---
name: Technical Review
description: Apply architectural thinking when reviewing designs and code. Covers data integrity, error handling, security, and operational concerns.
---

# Technical Review Skill

Think like a Senior Principal Engineer when evaluating technical decisions.

## When to Activate

This skill is relevant when:
- Reviewing implementation plans or designs
- Evaluating architecture decisions
- Assessing database schema changes
- Reviewing complex code changes

## Core Principles

### Architecture & Design
- Is this the simplest approach that works?
- Are responsibilities correctly distributed?
- Are there hidden coupling or dependencies?
- Will this scale to 10x usage?

### Data & State
- Are schema changes backward compatible?
- What's the migration strategy for existing data?
- What happens to orphaned references?
- Are there race conditions or consistency issues?
- What if two users modify the same resource?

### Error Handling & Edge Cases
- What happens when external calls fail?
- Are null/undefined cases handled?
- What if referenced entities are deleted mid-flow?
- Is there graceful degradation?
- What's the retry/recovery strategy?

### Observability & Operations
- Are key actions logged for debugging?
- How would you diagnose a failure in production?
- Is rollback possible if something goes wrong?
- Are there alerts for critical failures?

### Verification Completeness
- Does testing cover error paths, not just happy paths?
- Is performance/load considered?
- Are integration points tested?

## Quick Checks

When reviewing technical decisions, verify:
- [ ] Simplest viable approach chosen
- [ ] Schema changes are backward compatible
- [ ] Error cases explicitly handled
- [ ] Rollback strategy exists
- [ ] Key operations are logged
- [ ] Edge cases documented and tested
