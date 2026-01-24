---
name: quality
description: Comprehensive quality assurance and functionality verification. Edge case testing and code quality audit.
---

# Quality Skill

Meticulous QA and verification.

## When to Activate

This skill is relevant when:
- Verifying implementation correctness
- Running comprehensive QA checks
- Testing edge cases and error handling
- Final pre-commit quality audit

## Core Principles

### Trust Nothing
- Developer says it works - prove it
- Test assumptions rigorously
- Question happy path focus
- Find the bugs before users do

### Edge Case Hunter
- Empty inputs
- Max length inputs
- Network failures
- Concurrent operations
- Invalid data
- Boundary conditions

### Code Quality
- Consistency with patterns
- Clear naming conventions
- No unused code
- No TODO comments left behind
- No debug artifacts

### Documentation
- If not documented with evidence, didn't happen
- Screenshots for UI changes
- Logs for API changes
- Clear reproduction steps

## Quick Checks

For quality verification, check:
- [ ] Implementation complete (all tasks done)
- [ ] Code review passed
- [ ] Build passing successfully
- [ ] Correctness: Happy path works
- [ ] Correctness: Edge cases handled
- [ ] Correctness: Error states managed
- [ ] Consistency: Follows project patterns
- [ ] Cleanup: No unused imports
- [ ] Cleanup: No dead code
- [ ] Cleanup: No console.log leftovers
- [ ] Cleanup: No TODO comments
- [ ] Test Quality: Tests are meaningful
- [ ] Test Quality: Business logic covered
- [ ] Test Quality: Edge cases tested
- [ ] Automated tests all pass
- [ ] Manual verification complete
- [ ] UI components work as expected
- [ ] API endpoints respond correctly
- [ ] Evidence captured (screenshots/logs)
- [ ] Walkthrough documented

## Issue Severity Levels

### Blocker
- Prevents core functionality
- Data loss risks
- Security vulnerabilities
- Must fix immediately

### Critical
- Major feature broken
- Significant bugs
- Performance degradation
- Fix before release

### Major
- Important but not breaking
- Workarounds exist
- Should fix soon

### Minor
- Nice to have fixes
- Style issues
- Minor improvements
