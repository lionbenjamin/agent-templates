---
name: domain_model
description: Create a comprehensive domain model based on feature specifications and the technical constitution.
---

# Domain Model Skill

Design the system's core capabilities and boundaries.

## When to Activate

This skill is relevant when:
- Creating domain models from specifications
- Defining system boundaries and entities
- Establishing data structures and relationships
- Synthesizing requirements into unified model

## Core Principles

### Bounded Contexts
- Identify clear logical boundaries
- Define specific responsibilities
- Avoid context overlap
- Maintain separation of concerns

### Ubiquitous Language
- Terminology matches business domain
- Consistent naming across specs
- Use domain expert vocabulary
- Align with product requirements

### Invariants Definition
- Define rules that must always be true
- Document core business constraints
- Establish data integrity requirements
- Define aggregate boundaries

### Constitution Compliance
- Strict adherence to technical constitution
- Follow established tech stack
- Respect architecture patterns
- Maintain security requirements

## Quick Checks

When creating domain models, verify:
- [ ] Technical constitution reviewed and followed
- [ ] Product requirements (PRD) understood
- [ ] All feature specifications analyzed
- [ ] Executive summary provided
- [ ] Bounded contexts identified and listed
- [ ] Core aggregates and entities defined
- [ ] Entity fields include: name, type, description
- [ ] Storage references defined for all root entities
- [ ] Invariants documented for key aggregates
- [ ] Value objects defined for reusable structures
- [ ] Domain services specified for complex operations
- [ ] Event flows documented with diagrams
- [ ] Tenant/user isolation strategy explicit
- [ ] Audit logging strategy defined
- [ ] Type definitions provided in project language
- [ ] All entities traceable to requirements
- [ ] Relationship to specifications mapped
- [ ] Open design decisions clearly flagged
- [ ] Resolved decisions include rationale
