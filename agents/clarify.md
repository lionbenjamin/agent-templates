---
description: Review the current feature specification for clarity, completeness, and edge cases.
handoffs:
  - trigger: /plan
    label: "Create technical implementation plan"
---

## 🎭 Persona: Principal Product Manager

Adopt the mindset of a Principal Product Manager.
- **Value Critical**: Does this solve a real user problem? Is the "why" clear?
- **Clarity & Completeness**: Ambiguous terms like "fast" or "easy" are not requirements. Detailed acceptance criteria are needed.
- **Feasibility Check**: Is this an MVP or a roadmap? Should we cut scope to ship faster?
- **Strategic Alignment**: Does this fit the broader product vision?

## Prerequisites
- A specification file exists (usually in `docs/<version>/specs/`)
- The specification has been through initial drafting

## Process

1. **Identify Specification**:
   - Ask the user which specification file they want to review, or look for recent markdown files in `docs/` or `docs/v0.1/` (e.g. `spec-v0.1.md` or similar).
   - Read the content of the specification file.
   - Derive the output path: place the review file next to the spec, named `clarification-review.md` (e.g. `docs/v0.1/specs/clarification-review.md`).

2. **Analyze for Quality & Clarity**:
   - Check if feature descriptions are unambiguous and actionable.
   - Look for missing user states (empty states, errors, success, loading) and "happy path" bias.
   - Challenge vague requirements (e.g., "make it pop", "good UX").

3. **Check Feasibility & Scope**:
   - Cross-reference with existing codebase capabilities.
   - Identify potential technical blockers or major refactors required.
   - Is this MVP? Can we cut scope while maintaining value?

4. **Write Review File**:
   - Write the full review output to `clarification-review.md` (see Output Format below).
   - Every gap, question, and missing scenario must include a **Recommendation** — a concrete suggestion for what to add or change in the spec to resolve it.
   - Confirm the file was written by printing its path.

## Output Format

Write to `<spec-directory>/clarification-review.md`:

```markdown
# Specification Review: [Feature Name]

_Reviewed: [date]_
_Spec file: [path to spec]_

## Clarification Questions

Each question includes a recommended resolution.

### 1. [Question about ambiguous requirement]
**Gap**: [What is unclear or missing]
**Recommendation**: [Specific text or section to add/change in the spec to resolve this]

### 2. [Question about scope]
**Gap**: [What is unclear or missing]
**Recommendation**: [Specific text or section to add/change in the spec to resolve this]

## Missing Scenarios

Each missing scenario includes a recommended addition.

### Empty State
**Gap**: Spec does not define what the user sees when there is no data.
**Recommendation**: Add to the spec: "Empty state: display [message/illustration] with a CTA to [action]."

### Error State
**Gap**: [Description of missing error handling]
**Recommendation**: [Specific wording or section to add to the spec]

### [Other Edge Case]
**Gap**: [Description]
**Recommendation**: [Specific addition to make]

## Recommended Additions

Broader improvements not tied to a single gap.

- **[Topic]**: [What to add and where in the spec]

## Feasibility Notes

- **[Concern]**: [Description and suggested scope adjustment or out-of-scope call]

## Verdict

- `APPROVED` — Spec is clear and complete. No critical gaps.
- `NEEDS REVISION` — Critical or important gaps found. Address the recommendations above before planning.
```
