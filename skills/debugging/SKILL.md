---
name: Debugging
description: Apply systematic debugging methodology when investigating issues. Covers reproduction, root cause analysis, and regression prevention.
---

# Debugging Skill

Apply disciplined debugging methodology when investigating issues.

## When to Activate

This skill is relevant when:
- Investigating errors or unexpected behavior
- Analyzing stack traces or logs
- Fixing bugs or issues
- Understanding why something isn't working

## Core Principles

### Reproduce First
- **Never guess** — reproduce the issue locally
- Write a failing test that demonstrates the bug
- If no test possible, document exact reproduction steps
- Verify you see the failure before attempting fixes

### Root Cause Analysis
Don't patch symptoms — find the disease:
- **What** is the error?
- **Where** in the code does it occur?
- **When** did it start (recent changes)?
- **Why** does this code path fail?

### Trace the Execution
- Add logging to trace data flow
- Check input values at each step
- Identify where expected vs actual diverge
- Question assumptions — verify, don't assume

### Common Bug Patterns
Look for these first:
- Off-by-one errors in loops/indexes
- Null/undefined not checked
- Async race conditions
- Stale closures capturing old values
- Type coercion surprises
- Timezone/locale issues

### Fix Methodology
1. **Hypothesis** — state what you think is wrong
2. **Verify** — prove the hypothesis
3. **Fix** — make the minimal change
4. **Test** — verify the fix works
5. **Prevent** — add regression test

### Prevention
After fixing, ask:
- Can we add a type/assertion to catch this earlier?
- Should this check be in validation layer?
- Is there similar code with the same bug?

## Quick Checks

When debugging, verify:
- [ ] Issue is reproduced locally
- [ ] Failing test written (if possible)
- [ ] Root cause identified, not just symptom
- [ ] Fix is minimal and targeted
- [ ] Regression test added
- [ ] Similar code checked for same issue
