---
name: plan
description: Create technical implementation plans from specifications. Uses TDD approach and defines clear verification strategy.
---

# Plan Skill

Architect solutions with technical implementation plans.

## When to Activate

This skill is relevant when:
- Creating implementation plans from specs
- Designing technical solutions
- Planning database and code changes
- Defining verification strategies

## Core Principles

### Scalability & Performance
- Will this query scale?
- Are patterns efficient?
- Consider performance early
- Plan for growth

### Data Integrity
- Design schema for correctness
- Use foreign keys and constraints
- Choose appropriate types
- Enforce data validation

### Future-Proofing
- Is this extensible?
- Avoid painting into corners
- Consider evolution paths
- Balance flexibility and simplicity

### Complexity Management
- Keep it simple
- Avoid over-engineering
- Use appropriate patterns
- Clear, maintainable design

### TDD Strategy
- TDD Strategy section MUST come before Proposed Changes in every plan
- List new test files to create, with specific test case names
- List existing test files to update, with specific additions
- For each test case, describe: input → expected output
- Specify test commands to run (e.g. `npm test`, `pytest`)
- State expected test count change (e.g. "+8 new tests")
- In Proposed Changes, list test file changes before implementation file changes

### Accessibility Planning
- Identify ARIA requirements early
- Plan keyboard navigation
- Consider screen readers
- Design for all users

## Quick Checks

When creating plans, verify:
- [ ] TDD strategy section present with test files, test cases, and test commands
- [ ] Test files listed BEFORE implementation files in Proposed Changes
- [ ] All spec requirements covered
- [ ] Database schema changes valid
- [ ] Test cases specified before code
- [ ] Accessibility requirements planned
- [ ] Existing code patterns reviewed
- [ ] Integration points identified
- [ ] Verification plan is detailed
- [ ] Manual and automated tests defined
- [ ] Breaking changes documented
- [ ] Migration strategy included
- [ ] Rollback plan exists
