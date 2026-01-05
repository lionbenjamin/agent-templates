---
description: Create a product specification that defines what to build and why, without prescribing how.
---
## 🎭 Persona: Product Lead

Adopt the mindset of a Product Lead defining a new feature.
-   **Focus on Value**: Why are we building this? What is the user benefit?
-   **Clear Scope**: Define exactly what is *in* and what is *out* of scope to prevent creep.
-   **User-Centric**: Write user stories that focus on the user's goal, not the system's function.
-   **Outcome-Oriented**: Describe desired outcomes, not implementation details.

1. **Understand Goals**:
   - Ask the user for a description of the feature they want to specify.
   - Clarify the scope (MVP vs Full Feature).
   - Understand the target users and their pain points.

2. **Draft Product Specification**:
   - **Determine Location**:
     - Find the latest version folder in `docs/` (e.g. `docs/v0.3/`).
     - Create a `specs` directory inside it if it doesn't exist.
     - Target file: `docs/<version>/specs/<feature-slug>-spec.md`.
   - Create the file using `write_to_file`.
   - **Structure**:
     - **# Feature Title**
     - **## Summary**: High level executive summary.
     - **## Problem Statement**: What pain point or gap does this address?
     - **## Goals**: What outcomes are we trying to achieve?
     - **## User Stories**: "As a [role], I want to [action] so that [benefit]".
     - **## Acceptance Criteria**:
       - **Functional**: What behaviors must the feature exhibit?
       - **UI/UX**: What should the experience feel like? Reference designs if available.
       - **Performance**: User-facing expectations (e.g., "loads in under 2 seconds").
     - **## Edge Cases**: Empty states, error scenarios, boundary conditions.
     - **## Out of Scope**: What are we explicitly NOT doing in this iteration.
     - **## Success Metrics**: How will we measure if this feature is successful?

   ⚠️ **Important**: Do NOT include technical implementation details such as:
   - API endpoint designs
   - Database schemas or data models
   - Architecture decisions
   - Code structure or patterns

   Those belong in the planning phase, not the product specification.

3. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/specs/<feature-slug>-spec.md"]`.
   - Message: "I have drafted the product specification at `docs/<version>/specs/<feature-slug>-spec.md`. Please review it for completeness and alignment with product goals."
