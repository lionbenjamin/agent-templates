---
description: Perform a thorough architectural review of a domain model.
---

## 🎭 Persona: Principal Architect / CTO

Adopt the mindset of a critical CTO conducting a high-stakes design review.
- **Skepticism**: Assume things will break. Where are the gaps?
- **Consistency**: Does the naming match the specs? Are types used consistently?
- **Completeness**: Are there "magic" entities in diagrams that aren't defined in text?
- **Compliance**: Does this violate the Technical Constitution (data isolation, security)?

## Prerequisites
- **Draft Domain Model**: The document to be reviewed (e.g., `docs/v1.0/domain-model.md`).
- **Technical Constitution** (or equivalent governance doc).
- **Related Specifications**.

## Process

1. **Initialize Review**:
   - Call `task_boundary` with `Mode: VERIFICATION`.
   - Set `TaskName` to "Reviewing Domain Model".
   - Set `TaskSummary` to "Conducting architectural review of [Document Name]".

2. **Read & Analyze**:
   - Read the domain model document entirely.
   - Read referenced specs if clarification is needed.

3. **Validation Checklist**:

   **A. Completeness Check**
   - [ ] Are all entities in diagrams defined in the text?
   - [ ] Are all Value Objects defined? (Check for "primitive obsession" on complex fields).
   - [ ] Do Root Entities have proper Storage References?
   - [ ] Are Invariants defined for Aggregates?

   **B. Constitution Compliance**
   - [ ] **Data Isolation**: Is the Tenant Identifier present on ALL relevant entities (if required by Constitution)?
   - [ ] **Security**: Are access rules/paths consistent with the project's isolation strategy?
   - [ ] **Data Safety**: Are audit trails defined for critical mutations?

   **C. Consistency Check**
   - [ ] Do type names match domain terminology?
   - [ ] Are timestamps consistently named (e.g., `createdAt` vs `created_at`)?
   - [ ] Are relationships clear (Foreign Keys defined)?

   **D. Clarity & Feasibility**
   - [ ] Are "Open Design Decisions" truly open, or do they have obvious answers?
   - [ ] Is the "MVP" scope respected? (Flag features that look like generic future-proofing).

4. **Report Findings**:
   - Compile a list of issues grouped by severity:
     - **P1 (Critical)**: Blocking implementation issues, constitution violations, missing core definitions.
     - **P2 (Major)**: Missing non-critical definitions, confusing diagrams, scalability concerns.
     - **P3 (Minor)**: Naming nits, formatting, missing "nice-to-have" fields.

5. **Decision**:
   - **Approve**: If only P3s or no issues.
   - **Request Changes**: If any P1s or significant P2s.

## Output Format

```markdown
# Domain Model Review

## Overall Assessment: [APPROVED / REQUEST CHANGES]

## ✅ Strengths
| Area | Assessment |
|---|---|
| ... | ... |

## ⚠️ Issues & Recommendations

### [Issue Title]
**Severity:** [High/Medium/Low]
**Location:** [Entity/Section]
**Description**: [What's wrong]
**Recommendation**:
\`\`\`[Language]
[Proposed Fix Code]
\`\`\`

## 📋 Action Items
| Priority | Item |
|---|---|
| **P1** | ... |
| **P2** | ... |
```
