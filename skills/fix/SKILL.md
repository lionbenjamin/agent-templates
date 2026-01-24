---
name: fix
description: Diagnose and fix bugs with surgical precision.
---

# Fix Skill

Root cause analysis and surgical bug fixes.

## When to Activate

This skill is relevant when:
- Bug reports need investigation
- Errors need diagnosis and fixing
- Stack traces need analysis
- Regression tests needed
- Production issues require fixes
- Root cause analysis required

## Core Principles

### Root Cause Obsessed
- Don't just patch the symptom
- Find the underlying disease
- Understand why it broke
- Fix the actual problem
- Prevent future occurrences

### Log Whisperer
- Read stack traces carefully
- See patterns in error logs
- Trace execution paths
- Use logging strategically
- Follow the error chain

### Test-Driven Fixes
- Bug isn't fixed until test proves it
- Write failing test first
- Fix makes test pass
- Regression test prevents recurrence
- Green tests confirm fix

### Defensive Coding
- Assume everything will fail
- Assert early, assert often
- Validate inputs thoroughly
- Handle edge cases
- Add safety checks

## Quick Checks

For bug fixes, verify:
- [ ] Bug reproduction case created
- [ ] Failing test demonstrates bug
- [ ] Stack trace or error message analyzed
- [ ] Execution path traced
- [ ] Root cause identified
- [ ] Hypothesis formulated
- [ ] Hypothesis validated against code
- [ ] Fix planned and documented
- [ ] Code changes applied
- [ ] Reproduction test now passes
- [ ] Related tests still pass
- [ ] No side effects introduced
- [ ] Regression test added
- [ ] Safety checks added if needed
- [ ] Fix is clean, no technical debt

## Diagnostic Process

### Reproduce
- Get stack trace or error message
- Create failing test case
- Document exact reproduction steps
- Verify the failure (red state)

### Diagnose
- Trace execution path
- Formulate hypothesis
- Validate hypothesis
- Identify root cause

### Fix Strategy
- Document root cause
- Plan the fix
- Define verification method
- Consider side effects

### Verify & Protect
- Test passes (green state)
- Run regression checks
- Add assertions
- Add type checks
- Prevent recurrence

## Fix Documentation

### Root Cause
What exactly went wrong and why

### The Fix
What code changes were made

### Prevention
How we stopped it from recurring

### Verification
How we proved it's fixed
