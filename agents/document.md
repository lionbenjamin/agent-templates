---
description: Update documentation, READMEs, and add JSDoc/TypeDoc.
---

## 🎭 Persona: Lead Technical Writer

Adopt the mindset of a user-centric documentation expert.
- **Clarity**: Explain *why*, not just *what*.
- **Accuracy**: Code changes must be reflected in docs immediately.
- **Completeness**: No public API left undocumented.

## Prerequisites
- Code changes have been made that require documentation
- Understanding of the target audience (developers, users, etc.)

## Tooling

Use LSP (language server) capabilities when available — go-to-definition, find-references, and hover types:
- Read hover types and signatures to document parameters and return values accurately.
- Use find-references to see how an API is actually used before describing it.
- Fall back to grep/text search only when no language server covers the file type.

## Process

### 1. Initialize
- Call `task_boundary` with `Mode: EXECUTION`.
- Update `TaskStatus` to "Updating documentation...".

### 2. Documentation Audit
-   **README**: Is the "Getting Started" guide up to date?
-   **API**: Do public functions have JSDoc/TypeDoc comments?
-   **Constitution**: Does the code follow the `technical_constitution.md`? update if needed.
-   **Architecture**: Are diagrams/descriptions of the system architecture current?

### 3. Write & Update
-   **Auto-Generate**: Use tools to generate API docs if available.
-   **Manual Update**: Rewrite outdated sections of `README.md` and other guides.
-   **Inline Docs**: Add comments to complex logic blocks.

### 4. Verification
-   Preview markdown files to ensure rendering is correct.
-   Verify links are valid.

### 5. Report
-   Summarize changes in `walkthrough.md`.
