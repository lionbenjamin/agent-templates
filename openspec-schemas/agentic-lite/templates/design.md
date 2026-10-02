# <!-- Feature Name --> Implementation Plan

<!-- Goal in 1-2 sentences. See proposal.md for motivation and specs/ for requirements. -->

## User Review Required

> [!IMPORTANT]
> <!-- Breaking changes, risky migrations, decisions the user should know about. "None" if none. -->

## Context

<!-- Current state and constraints that shape the approach. -->

## Decisions

<!-- Key technical choices: chosen option, alternatives considered, why. -->

## Constitution Compliance

<!-- Constraints from technical_constitution.md / RULES.md this design touches, and how
     it meets each. Deviations: "None", or each one with its reason (also listed under
     User Review Required). "No constitution file" if the project has none. -->

- <!-- constraint --> - <!-- how this design complies -->

## Impact

- **Code**: <!-- affected modules / packages -->
- **APIs**: <!-- new or changed endpoints, events, contracts -->
- **Data**: <!-- schema or storage changes -->
- **Dependencies**: <!-- added / removed / upgraded -->

## Security Surface

- API routes / server handlers: <!-- yes / no -->
- Auth / session: <!-- yes / no -->
- Security rules / permissions: <!-- yes / no -->
- Spend / billing paths: <!-- yes / no -->
- Parsing untrusted input: <!-- yes / no -->
- New dependency: <!-- yes / no -->

## TDD Strategy

### Requirement → Test Map

| Requirement / Scenario | Test case | Input → Expected |
|---|---|---|
| <!-- spec scenario --> | <!-- test name --> | <!-- input → expected --> |

### New Test Files

- `<!-- path -->` - <!-- what it covers -->

### Existing Test Updates

- `<!-- path -->` - <!-- additions -->

### Test Commands

- `<!-- command -->` - <!-- expected test count change, e.g. +8 -->

## Accessibility Strategy

<!-- Interactive elements needing ARIA roles, focus handling, keyboard paths. "N/A" if no UI. -->

## Proposed Changes

### <!-- Component --> - Tests

#### [NEW] `<!-- path -->`
- <!-- change -->

### <!-- Component --> - Implementation

#### [MODIFY] `<!-- path -->`
- <!-- change -->

## Risks / Migration / Rollback

- <!-- [Risk] → Mitigation -->
- **Rollback**: <!-- how to undo -->

## Verification Plan

### Automated

- `<!-- command -->` - <!-- what it proves -->

### Manual

- [ ] <!-- manual check -->

## Open Questions

<!-- Only unknowns that would not change specs, approach or task breakdown. Omit if none. -->

## Revision Notes

<!-- Changes made in response to plan review rounds. -->
