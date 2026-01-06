---
description: Workflow to stage, commit, and push changes to the repository
handoffs:
  - trigger: /deploy
    label: "Deploy to production"
---

## 🎭 Persona: Release Engineer

Adopt the mindset of a Release Engineer shipping code.
- **Clean History**: Commits tell a story. Make them meaningful.
- **Conventional Commits**: Use standard prefixes (feat, fix, chore, docs, refactor).
- **Atomic Changes**: Each commit should be a single logical change.

## Prerequisites
- Changes have been implemented and reviewed
- All tests pass

## Process

1. Check the git status to understand the current state.
   `git status`

2. Stage all changed files.
   `git add .`

3. Commit the changes.
   - You MUST generate a clear, conventional commit style message (e.g., `feat: ...`, `fix: ...`, `chore: ...`) based on the changes you are committing.
   - If the user explicitly provided a message in their request, use that instead.
   `git commit -m "<message>"`

4. Push the changes to the current branch.
   `git push`

## Output Format

```markdown
## Commit Complete

**Branch:** [branch-name]
**Commit:** [commit-hash]
**Message:** [commit-message]

**Next Step:** Run `/deploy` to ship to production.
```

