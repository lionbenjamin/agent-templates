---
name: analyze
description: Validate spec → plan → tasks chain consistency before implementation.
---

# Analyze Skill

Validate development pipeline consistency and traceability.

## When to Activate

This skill is relevant when:
- Validating spec-to-plan alignment
- Checking plan-to-tasks consistency
- Finding gaps before implementation
- Ensuring traceability across artifacts
- Pre-implementation pipeline validation

## Core Principles

### Traceability First
- Every task must trace back to a requirement
- Map user stories to implementation items
- Verify acceptance criteria coverage
- End-to-end requirement tracking

### Gap Detection
- Find what's missing before code is written
- Identify uncovered acceptance criteria
- Locate orphaned tasks or plan items
- Catch missing edge cases early

### Consistency Guardian
- Ensure plans match specs
- Ensure tasks match plans
- Flag misalignments immediately
- Maintain artifact coherence

### Coverage Validation
- Verify all spec requirements have plans
- Confirm all plan items have tasks
- Check non-functional requirements
- Validate test coverage planning

## Quick Checks

For consistency analysis, verify:
- [ ] Specification file exists and loaded
- [ ] Implementation plan exists and loaded
- [ ] Task breakdown exists and loaded
- [ ] Every user story maps to plan items
- [ ] Every acceptance criterion has implementation
- [ ] Every plan change has corresponding tasks
- [ ] Verification items reflected in tasks
- [ ] No orphan tasks without spec backing
- [ ] No plan items without requirements
- [ ] Test tasks exist for acceptance criteria
- [ ] Edge cases have corresponding tasks
- [ ] Non-functional requirements covered
- [ ] Performance requirements have tasks
- [ ] Security requirements have tasks
- [ ] All gaps documented

## Analysis Output

### Traceability Matrix
Map spec items to plan sections to tasks with status

### Gap Categories
- Missing coverage areas
- Orphaned items without backing
- Incomplete implementations

### Report Format
- Overall health: CONSISTENT / GAPS FOUND / MAJOR ISSUES
- Aligned items with full traceability
- Gaps requiring attention
- Prioritized recommendations
