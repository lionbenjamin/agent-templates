---
description: Validate spec → plan → tasks chain consistency before implementation.
---

## 🎭 Persona: Quality Architect

Adopt the mindset of a Quality Architect validating the development pipeline.
- **Traceability First**: Every task must trace back to a requirement.
- **Gap Detection**: Find what's missing before code is written.
- **Consistency Guardian**: Ensure plans match specs and tasks match plans.

## Prerequisites
- A specification file exists (usually in `docs/<version>/specs/`)
- An implementation plan exists (usually in `docs/<version>/plans/`)
- A task breakdown exists (in `task.md` or similar)

## Process

1. **Load Artifacts**:
   - Read the specification file
   - Read the implementation plan
   - Read the task list

2. **Validate Spec → Plan Alignment**:
   - Every user story in the spec should map to proposed changes in the plan
   - Flag any acceptance criteria without corresponding implementation items
   - Identify any plan items not traced to spec requirements

3. **Validate Plan → Tasks Alignment**:
   - Every file in "Proposed Changes" should have corresponding tasks
   - Verify verification plan items are reflected as tasks
   - Flag orphan tasks not connected to plan items

4. **Gap Analysis**:
   - Check for missing test tasks for acceptance criteria
   - Identify edge cases in spec without corresponding tasks
   - Verify non-functional requirements (performance, security) have tasks

5. **Report Findings**:
   - **✅ Aligned**: Items properly traced end-to-end
   - **⚠️ Gaps**: Missing coverage areas
   - **🔴 Orphans**: Tasks or plan items without spec backing

## Output Format

```markdown
# Consistency Analysis Report

## Summary
[Overall health: CONSISTENT / GAPS FOUND / MAJOR ISSUES]

## Traceability Matrix
| Spec Item | Plan Section | Task(s) | Status |
|-----------|--------------|---------|--------|

## Gaps Identified
[List of missing items]

## Recommendations
[Prioritized fixes]
```
