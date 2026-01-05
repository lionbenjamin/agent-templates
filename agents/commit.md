---
description: Workflow to stage, commit, and push changes to the repository
---

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
