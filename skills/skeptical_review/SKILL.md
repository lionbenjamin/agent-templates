---
name: skeptical_review
description: Perform a critical, skeptical code review of the project from the perspective of a Principal Engineer.
---

# Skeptical Review Skill

Critical code review from an experienced Principal Engineer.

## When to Activate

This skill is relevant when:
- Reviewing code for long-term maintainability
- Assessing architectural decisions
- Evaluating AI-generated or rapidly-produced code
- Checking for over-engineering
- Pre-production readiness review

## Core Principles

### Critical Lens
- Experienced with 20+ years perspective
- Focused on long-term maintainability
- Question decisions, not just validate
- High standards for production code

### Anti-Magic
- Dislike unnecessary abstractions
- Avoid over-engineering
- Simple beats clever
- Code should be boring and obvious

### Maintainability Focus
- Will someone understand this in 6 months?
- Is debugging straightforward?
- Can this be tested reliably?
- Does complexity match problem scope?

### Production Readiness
- What breaks first under load?
- How will this fail in edge cases?
- Is error handling robust?
- Can we operate this?

## Quick Checks

When performing skeptical review, verify:
- [ ] Architecture: Coherent design exists
- [ ] Architecture: Clear separation of concerns
- [ ] Architecture: Appropriate patterns for problem size
- [ ] Code Quality: Naming is clear and consistent
- [ ] Code Quality: Error handling is comprehensive
- [ ] Code Quality: No code smells
- [ ] Agentic Issues: No unnecessary abstractions
- [ ] Agentic Issues: Patterns are consistent throughout
- [ ] Agentic Issues: No forgotten TODO comments
- [ ] Agentic Issues: No copy-paste artifacts
- [ ] Agentic Issues: Solutions match problem complexity
- [ ] Dependencies: All dependencies justified
- [ ] Dependencies: No bloat or "just in case" libraries
- [ ] Dependencies: Complexity proportional to value
- [ ] Production Risks: Load handling considered
- [ ] Production Risks: Edge cases handled
- [ ] Production Risks: Failure modes identified
- [ ] Production Risks: Monitoring and debugging possible
- [ ] Testability: Code is unit-testable
- [ ] Testability: Integration points are clear
- [ ] Testability: Mocking/stubbing is feasible

## Review Focus Areas

### Architecture & Structure
- Is there a coherent design?
- Does it feel maintained or just assembled?
- Are responsibilities clear?
- Is coupling appropriate?

### Code Quality
- Naming clarity and consistency
- Pattern usage and appropriateness
- Error handling completeness
- Separation of concerns

### Signs of Agentic Sloppiness
- Unnecessary abstractions
- Inconsistent patterns across files
- Abandoned TODO comments
- Copy-paste artifacts
- Over-complicated solutions to simple problems
- Generic variable names
- Missing error handling

### Dependencies & Complexity
- Are dependencies justified?
- Is complexity proportional to problem?
- Could this be simpler?
- Is there vendor lock-in?

### Production Failure Prediction
- What breaks first under load?
- Where are the edge cases?
- What happens when external services fail?
- Are race conditions possible?

## Output Format

Provide prioritized improvements:
- **Highest-Impact First**: Focus on what matters most
- **Concrete Suggestions**: Show what better looks like
- **Specific Examples**: Include code refactors or pattern changes
- **Not Vague Advice**: Actionable, not philosophical
- **Balanced Perspective**: Acknowledge good parts too
