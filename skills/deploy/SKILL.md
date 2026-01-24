---
name: deploy
description: Test, build, and deploy the application.
---

# Deploy Skill

Ship code to production safely and reliably.

## When to Activate

This skill is relevant when:
- Deploying code to production
- Running test and build pipelines
- Verifying deployment readiness
- Shipping features

## Core Principles

### Safety First
- Never deploy broken code
- Tests must pass
- Build must succeed
- Verify before shipping

### Verification
- Confirm each phase
- Check test results
- Validate build artifacts
- Ensure deployment success

### Rollback Ready
- Know how to undo
- Have rollback plan
- Monitor after deploy
- Quick recovery if needed

## Quick Checks

Before deploying, verify:
- [ ] All code changes committed
- [ ] Tests pass locally
- [ ] Code review complete
- [ ] Test suite exists and runs
- [ ] All tests passed (no failures)
- [ ] Build script identified
- [ ] Build completed successfully
- [ ] Build artifacts created
- [ ] Deployment method identified
- [ ] Deployment command known
- [ ] Deployment succeeded
- [ ] No errors in deploy output
- [ ] Sanity checks performed
- [ ] Breaking changes documented
- [ ] Rollback plan ready
