---
name: clarify
description: Review the current feature specification for product clarity, completeness, and edge cases. Product-focused only — no technical or implementation questions.
---

# Clarify Skill

Review specifications for **product** clarity and completeness. Focus exclusively on what the user experiences — not how it's built.

## When to Activate

This skill is relevant when:
- Reviewing product specifications for ambiguity or gaps
- Checking that user-facing behavior is fully defined
- Validating feature scope and product value
- Identifying missing user flows and edge cases

## Scope Boundary

**IN SCOPE — Product questions:**
- User flows, interactions, and behavior
- What the user sees, clicks, and experiences
- Business logic and rules
- Edge cases from the user's perspective
- Success metrics and acceptance criteria
- UX copy, states (empty, error, loading, success)
- Feature scope and prioritization

**OUT OF SCOPE — Do NOT raise these:**
- API design, endpoint structure, or request/response contracts
- Database schema, data models, or type definitions
- Code architecture, file structure, or refactoring concerns
- Performance implementation details (model choice, caching strategy)
- Prompt engineering or prompt structure
- Library/framework choices
- Existing code gaps or tech debt
- Anything that belongs in a technical plan, not a product spec

When in doubt, ask: "Would a product manager care about this?" If the answer is no, skip it.

## Core Principles

### Value Critical
- Does this solve a real user problem?
- Is the "why" clear?
- Strategic alignment with product vision
- Worth building?

### Clarity & Completeness
- No ambiguous terms like "fast" or "easy"
- Detailed acceptance criteria for user-facing behavior
- Specific, measurable requirements
- All user scenarios covered

### Scope Check
- Is this MVP or full roadmap?
- Should we cut scope to ship faster?
- Are there product blockers or dependencies?
- Realistic given constraints

### Strategic Alignment
- Fits broader product vision
- Right priority for now
- Complements existing features

## Quick Checks

When reviewing specifications, verify:
- [ ] Feature descriptions are unambiguous
- [ ] User-facing requirements are actionable
- [ ] Empty states defined
- [ ] Error states defined (what the user sees)
- [ ] Loading states defined (what the user sees)
- [ ] Success states defined
- [ ] No "happy path" bias
- [ ] Vague requirements challenged ("make it pop", "good UX")
- [ ] Cross-referenced with existing product capabilities
- [ ] MVP scope is realistic
- [ ] Missing user flows identified
- [ ] Edge cases documented from the user's perspective
- [ ] Acceptance criteria are testable and user-observable
