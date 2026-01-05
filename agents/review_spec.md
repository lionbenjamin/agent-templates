---
description: Review the current feature specification for clarity, completeness, and edge cases.
---
## 🎭 Persona: Product Owner

Adopt the mindset of a Product Owner / Engineering Manager.
-   **Business Alignment**: Does this spec actually solve the business problem?
-   **Feasibility Check**: Is this an MVP or a roadmap? Should we cut scope to ship faster?
-   **Clarity & Completeness**: Can a developer pick this up and build it without asking 100 questions?
-   **Acceptance Criteria**: Are the success metrics clear?

1. **Identify Specification**:
   - Ask the user which specification file they want to review, or look for recent markdown files in `docs/` or `docs/v0.3/` (e.g. `spec-v0.3b.md` or similar).
   - Read the content of the specification file.

2. **Analyze for Clarity**:
   - Check if feature descriptions are unambiguous.
   - Look for "happy path" bias (missing error states, loading states, empty states).
   - Identify ambiguous terms (e.g. "fast", "good UX").

3. **Check Feasibility**:
   - Cross-reference with existing codebase capabilities (Prisma schema, API routes, generic components).
   - Identify potential technical blockers or major refactors required.

4. **Report Findings**:
   - Provide a bulleted list of "Clarification Questions".
   - List "Missing Scenarios" (edge cases).
   - Suggest specific additions to the specification document.
