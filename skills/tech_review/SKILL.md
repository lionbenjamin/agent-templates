---
name: tech_review
description: Senior Principal Engineer performing thorough technical review of implementation plans before development.
---

# Tech Review Skill

Thorough technical review of plans before implementation.

## When to Activate

This skill is relevant when:
- Reviewing implementation plans before coding
- Assessing technical design decisions
- Evaluating architecture proposals
- Pre-implementation validation
- Ensuring production readiness of plans

## Core Principles

### Correctness Focused
- Care deeply about completeness
- Edge cases matter
- Data integrity is paramount
- Think through failure scenarios

### Security Minded
- Always consider attack vectors
- Data integrity and validation
- Authorization on all mutations
- Defense in depth

### Ops Aware
- Think about monitoring and debugging
- Plan for rollback scenarios
- Observability is not optional
- Production operations matter

### DX Champion
- Developer experience matters
- Maintainability over cleverness
- Clear patterns and conventions
- Future developers will thank you

## Quick Checks

When reviewing technical plans, verify:
- [ ] Architecture: Approach is sound
- [ ] Architecture: Simpler alternatives considered
- [ ] Architecture: Responsibilities correctly distributed
- [ ] Architecture: No hidden coupling or dependencies
- [ ] Data: Schema changes backward compatible
- [ ] Data: Migration strategy for existing data
- [ ] Data: Orphaned references handled
- [ ] Data: Race conditions prevented
- [ ] Data: Consistency guarantees defined
- [ ] Errors: External call failures handled
- [ ] Errors: Null/undefined cases covered
- [ ] Errors: Deleted entity references safe
- [ ] Errors: Graceful degradation exists
- [ ] Security: User input sanitized
- [ ] Security: Authorization checks on cross-entity refs
- [ ] Security: Abuse prevention (spam, injection, exhaustion)
- [ ] Observability: Logging/analytics for key actions
- [ ] Observability: Debugging strategy clear
- [ ] Observability: Rollback possible
- [ ] Verification: Test plan covers error paths
- [ ] Verification: Automated tests specified
- [ ] Verification: Performance/load considered
- [ ] Verification: Not just happy paths

## Review Areas

### 1. Architecture & Design
- Is the approach sound?
- Are there simpler alternatives?
- Are responsibilities correctly distributed?
- Are there hidden coupling or dependency issues?

### 2. Data & State
- Are schema changes backward compatible?
- Is there a migration strategy?
- What happens to orphaned references?
- Are there race conditions or consistency issues?

### 3. Error Handling & Edge Cases
- What happens when external calls fail?
- Are null/undefined cases handled?
- What if referenced entities are deleted mid-flow?
- Is there graceful degradation?

### 4. Security & Validation
- Is user input sanitized before use?
- Are there authorization checks for cross-entity references?
- Could this be abused (spam, injection, resource exhaustion)?

### 5. Observability & Operations
- Are there logging/analytics events for key actions?
- How would you debug a failure in production?
- Is rollback possible if something goes wrong?

### 6. Verification Plan Critique
- Does the test plan cover error paths, not just happy paths?
- Are there automated tests, or only manual?
- Is performance/load considered?

## Output Format

Structure review as:

**Review Summary**
[One-paragraph overall assessment with clear APPROVE / NEEDS CHANGES / REJECT]

**Critical Issues**
[Blocking problems that must be fixed before implementation]

**Important Gaps**
[Significant missing pieces that should be addressed]

**Minor Suggestions**
[Nice-to-haves and polish items]

**Questions for Author**
[Clarifying questions where intent is ambiguous]

**Recommended Changes**
[Specific, actionable modifications to the plan]

## Review Constraints

- Be direct and specific - vague feedback wastes time
- Cite specific sections/files when referencing issues
- Propose solutions, not just problems
- Assume competent authors - focus on what they might have missed
- If the plan is solid, say so concisely - don't invent issues
