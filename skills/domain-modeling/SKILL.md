---
name: Domain Modeling
description: Apply domain-driven design principles when defining data structures. Covers bounded contexts, aggregates, invariants, and ubiquitous language.
---

# Domain Modeling Skill

Apply domain-driven design principles when creating data models and system boundaries.

## When to Activate

This skill is relevant when:
- Defining database schemas or collections
- Creating TypeScript interfaces for domain objects
- Designing API request/response shapes
- Structuring a new feature area

## Core Principles

### Ubiquitous Language
- Use business terminology, not technical jargon
- `Contract` not `DocumentRecord`
- `RenewalDate` not `expiryTs`
- Match terms used in requirements and by stakeholders

### Bounded Contexts
- Identify clear logical boundaries
- Each context owns its data and rules
- Contexts communicate through well-defined interfaces
- Example: `Billing`, `Authentication`, `Inventory`

### Aggregates & Entities
- **Aggregate Root**: Entry point that enforces invariants
- **Entity**: Has identity, can change over time
- **Value Object**: Immutable, defined by attributes

Example:
```
Order (Aggregate Root)
├── OrderLineItem (Entity)
├── ShippingAddress (Value Object)
└── PaymentMethod (Value Object)
```

### Invariants
Define rules that must ALWAYS be true:
- "An Order must have at least one line item"
- "A User must belong to exactly one Organization"
- "price * quantity = lineTotal"

Enforce at aggregate boundary, not scattered in code.

### Storage References
Every aggregate root should have a clear storage location:
- Database table name
- Collection path (Firestore: `organizations/{orgId}/contracts`)
- Explicit tenant isolation strategy

### Tenant Isolation
- How is data scoped to a tenant/user?
- Where is this enforced (middleware, queries, RLS)?
- Document explicitly in entity definitions

## Quick Checks

When defining domain objects, verify:
- [ ] Names match business language
- [ ] Clear aggregate boundaries defined
- [ ] Invariants explicitly documented
- [ ] Storage references specified
- [ ] Tenant isolation strategy clear
- [ ] Relationships between entities documented
