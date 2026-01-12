---
description: Create a comprehensive domain model based on feature specifications and the technical constitution.
handoffs:
  - trigger: /review_domain
    label: "Get architectural review of the domain model"
---

## 🎭 Persona: Principal Architect

Adopt the mindset of a Principal Architect defining the system's core capabilities and boundaries.
- **Bounded Contexts**: Identify clear logical boundaries (e.g., specific responsibilities).
- **Ubiquitous Language**: Ensure terminology matches the business domain found in the specs.
- **Invariants**: Define the rules that must always be true (e.g., "A user must always belong to a tenant").
- **Constitution Compliance**: Ensure strict adherence to the project's technical constitution (e.g., tech stack, patterns, security).

## Prerequisites
- **Technical Constitution**: The project's architecture governance strategy (e.g., `docs/technical_constitution.md`).
- **Product Requirements**: PRD or high-level scope document.
- **Feature Specifications**: Functionality specs (typically in `docs/<version>/specs/`).

## Process

1. **Information Gathering**:
   - Read the **Technical Constitution** to understand non-negotiable constraints.
   - Read the **PRD** for high-level scope.
   - Read **ALL Feature Specifications** to understand the granular data requirements and flows.

2. **Initialize Domain Modeling**:
   - Call `task_boundary` with `Mode: PLANNING`.
   - Set `TaskName` to "Creating Domain Model".
   - Set `TaskSummary` to "Synthesizing specs into a unified domain model".
   - Create the target file: `docs/<version>/domain-model.md`.

3. **Draft the Domain Model**:
   - **Executive Summary**: Brief overview and sources.
   - **Bounded Contexts**: Identify and list the major contexts.
   - **Core Aggregates & Entities**:
     - Group with H3 headers per Bounded Context.
     - Define Entities with tables (Field, Type, Description).
     - **CRITICAL**: Include "Storage Reference" for every Root Entity / Aggregate Root (e.g., Table Name, Collection Path).
     - **CRITICAL**: Define "Invariants" for key Aggregates.
   - **Value Objects**: Define reusable structures.
   - **Domain Services**: Define the interfaces for complex operations that don't fit on a single entity.
   - **Event Flows**: Use Mermaid sequence diagrams for critical business processes.
   - **Tenant Isolation**: Explicitly document how tenant/user isolation is enforced (based on Constitution).
   - **Compliance & Audit**: Define audit logging strategy.
   - **Type Definitions**: Provide interfaces/enums for all custom types (in the project's primary language).
   - **Design Decisions**:
     - List **Resolved** decisions with rationale.
     - List **Open** decisions that need User input (use `> [!IMPORTANT]` alerts).

4. **Verify Traceability**:
   - Ensure every entity can be traced back to a requirement in a Spec or the PRD.
   - Add a "Relationship to Specifications" table mapping specs to entities.

5. **Request Review**:
   - Call `notify_user` with `PathsToReview: ["/absolute/path/to/docs/<version>/domain-model.md"]`.
   - Message: "I have drafted the domain model. Please review the Open Design Decisions and overall structure."

## Output Format Settings
- **Language**: Markdown
- **Diagrams**: Mermaid (Graph TB for Context Map, SequenceDiagram for flows)
- **Types**: Partial code interfaces (e.g., TypeScript, Go, Python depending on project)

## Example Structure

```markdown
# [Project Name] Domain Model

## Bounded Contexts
### 1. [Context Name]
...

## Core Aggregates
### [Context Name]
#### [Entity Name] (Entity)
| Field | Type | Description |
|---|---|---|
...
**Storage Reference:** \`[Path or Table Name]\`

## Value Objects
### [Value Object Name]
\`\`\`[Language]
interface ValueObject { ... }
\`\`\`

## Open Design Decisions
> [!IMPORTANT]
> 1. **Decision Name**: Options A vs B?
```
