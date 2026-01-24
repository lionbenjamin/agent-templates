---
name: commit
description: Stage, commit, and push changes with conventional commit style. Creates meaningful commit messages and clean git history.
---

# Commit Skill

Professional git workflow with conventional commits.

## When to Activate

This skill is relevant when:
- Staging and committing code changes
- Creating meaningful commit messages
- Following conventional commit standards
- Maintaining clean git history

## Core Principles

### Clean History
- Commits tell a story
- Make them meaningful and descriptive
- Each commit is a logical unit
- Easy to understand in hindsight

### Conventional Commits
- Use standard prefixes consistently
- `feat:` for new features
- `fix:` for bug fixes
- `chore:` for maintenance
- `docs:` for documentation
- `refactor:` for code restructuring
- `test:` for test changes

### Atomic Changes
- Each commit = single logical change
- Don't mix unrelated changes
- Makes reverting easier
- Simplifies code review

### Pre-Commit Verification
- All tests should pass
- Code has been reviewed
- No broken functionality
- Build succeeds

## Quick Checks

Before committing, verify:
- [ ] All changes are intentional
- [ ] Tests pass locally
- [ ] Code has been reviewed (or self-reviewed)
- [ ] Commit message follows conventional format
- [ ] Message describes "why" not just "what"
- [ ] No sensitive data included (credentials, keys)
- [ ] No debug code or console.logs left behind
- [ ] Related changes grouped together
- [ ] Unrelated changes separated
- [ ] Breaking changes documented
