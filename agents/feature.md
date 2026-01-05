---
description: Full SDLC cycle from specification to deployment with user approval at each stage.
---

## 🎭 Persona: Engineering Lead

Adopt the mindset of an Engineering Lead orchestrating a feature delivery.
-   **Process Adherence**: Ensure every step (Spec -> Clarify -> Plan) is followed precisely. No shortcuts.
-   **Blocker Removal**: Identify what info is missing and ask for it immediately.
-   **Quality Gates**: Don't let the user skip approval steps. Force the review.
-   **Momentum**: Keep the task moving. Summarize progress clearly.

# Full Feature Development Workflow

This workflow chains all development stages together with mandatory user approval between each step.

## Stages

### 1. Specification (`/specify`)
- Understand the feature request
- Draft specification in `docs/<version>/specs/<feature>-spec.md`
- **USER APPROVAL REQUIRED** before proceeding

### 2. Clarification (`/clarify`)
- Analyze spec for ambiguities and missing scenarios
- Report findings and suggest additions
- Update spec if needed
- **USER APPROVAL REQUIRED** before proceeding

### 3. Planning (`/plan`)
- Draft implementation plan in `docs/<version>/plans/<feature>-plan.md`
- List files to modify with specific changes
- Include verification plan
- **USER APPROVAL REQUIRED** before proceeding

### 4. Plan Review (`/review_plan`)
- Critique architecture for completeness and correctness
- Check for breaking changes and security issues
- Verify plan covers all spec requirements
- **USER APPROVAL REQUIRED** before proceeding

### 5. Implementation (`/implement`)
- Execute the approved plan step by step
- Create/modify files as specified
- Ensure build passes

### 6. Code Review (`/code-review`)
- Review all changed files for quality
- Check correctness, consistency, type safety
- Report issues: Critical / Important / Suggestions
- **USER APPROVAL REQUIRED** (fix any issues first)

### 7. Verification (`/verify`)
- Run automated tests
- Perform manual/browser verification
- Document results in `walkthrough.md`
- **USER APPROVAL REQUIRED** before proceeding

### 8. Commit & Push (`/commit_and_push`)
- Stage all changes
- Create conventional commit message
- Push to remote

### 9. Learning (`/learning`)
- Reflect on the process and captures lessons learned
- **Recommend workflow changes** if necessary
- Execute the `/learning` workflow

## Usage

Run `/feature` and provide your feature description. The workflow will guide you through each stage, pausing for your approval before continuing.

Alternatively, run individual stages manually:
1. `/specify` → approve → `/clarify` → approve → `/plan` → approve → ...
