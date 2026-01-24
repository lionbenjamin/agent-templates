---
name: review_domain
description: Perform a thorough architectural review of a domain model.
---

# Review Domain Skill

Conduct critical architectural review of domain models.

## When to Activate

This skill is relevant when:
- Domain model has been drafted
- Need to validate architecture design
- Checking constitution compliance
- Verifying completeness and consistency

## Core Principles

### Skeptical Analysis
- Assume things will break
- Identify gaps proactively
- Challenge assumptions
- Look for edge cases

### Consistency Verification
- Naming matches specifications
- Types used consistently
- Terminology aligned with domain
- Standards applied uniformly

### Completeness Check
- No "magic" entities undefined
- All diagrams match text
- Every reference resolved
- No missing definitions

### Compliance Enforcement
- Validate against technical constitution
- Check data isolation requirements
- Verify security constraints
- Ensure audit requirements met

## Quick Checks

When reviewing domain models, verify:
- [ ] **Completeness**: All entities in diagrams defined in text
- [ ] **Completeness**: All value objects defined
- [ ] **Completeness**: No primitive obsession on complex fields
- [ ] **Completeness**: Root entities have storage references
- [ ] **Completeness**: Invariants defined for aggregates
- [ ] **Constitution**: Tenant identifier on all relevant entities (if required)
- [ ] **Constitution**: Access rules match isolation strategy
- [ ] **Constitution**: Security paths consistent with requirements
- [ ] **Constitution**: Audit trails defined for critical mutations
- [ ] **Consistency**: Type names match domain terminology
- [ ] **Consistency**: Timestamps consistently named
- [ ] **Consistency**: Relationships clear with foreign keys defined
- [ ] **Clarity**: Open design decisions are truly open
- [ ] **Clarity**: MVP scope respected, no premature future-proofing
- [ ] Issues grouped by severity (P1 Critical, P2 Major, P3 Minor)
- [ ] Strengths acknowledged
- [ ] Recommendations provided with code examples
- [ ] Action items prioritized
- [ ] Final decision: Approve or Request Changes
