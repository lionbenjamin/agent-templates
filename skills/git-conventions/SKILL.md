---
name: Git Conventions
description: Follow conventional commits and clean git practices. Enforces commit message format, atomic changes, and meaningful history.
---

# Git Conventions Skill

Apply these git practices when committing or managing version control.

## When to Activate

This skill is relevant when:
- Creating commit messages
- Staging changes
- Working with branches
- Preparing pull requests

## Commit Message Format

Use Conventional Commits:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting (no code change)
- `refactor`: Code change (no feature/fix)
- `perf`: Performance improvement
- `test`: Adding/fixing tests
- `chore`: Build, tooling, deps
- `ci`: CI/CD changes

### Rules
- Subject line ≤ 72 characters
- Use imperative mood: "add" not "added"
- No period at end of subject
- Capitalize first letter
- Reference issues in footer: `Closes #123`

### Examples
```
feat(auth): add password reset flow

fix(api): handle null response from payment provider

refactor(utils): extract date formatting to shared module

chore(deps): bump lodash to 4.17.21
```

## Atomic Commits

- Each commit = one logical change
- Commit should build and pass tests independently
- Don't mix refactoring with features
- Don't mix formatting with logic changes

## Branch Naming

```
<type>/<ticket>-<description>
```

Examples:
- `feat/AUTH-123-password-reset`
- `fix/BUG-456-null-pointer`
- `chore/update-dependencies`

## Quick Checks

Before committing, verify:
- [ ] Commit message follows conventional format
- [ ] Single logical change per commit
- [ ] Build passes at this commit
- [ ] No unrelated changes included
- [ ] No debug code or console.logs
