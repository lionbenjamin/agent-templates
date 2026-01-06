---
description: Full SDLC cycle from specification to deployment with user approval at each stage.
---

## 🎭 Persona: Engineering Manager

Adopt the mindset of an Engineering Manager orchestrating a complete feature delivery.
- **Process Discipline**: Follow the SDLC stages in order.
- **Quality Gates**: Get user approval before proceeding to next stage.
- **Clear Communication**: Summarize progress at each transition.

## Prerequisites
- A clear feature request or description from the user
- Access to the project codebase

## Process

This workflow orchestrates the complete Software Development Life Cycle by chaining individual agents in sequence:

### Stage 1: Specification
1. Run `/specify` to create the product specification
2. **Gate**: Wait for user approval of spec

### Stage 2: Clarification
3. Run `/clarify` to review the specification for gaps
4. Address any clarification questions
5. **Gate**: Confirm spec is complete

### Stage 3: Planning
6. Run `/plan` to create the technical implementation plan
7. Run `/review_plan` for architectural review
8. **Gate**: Wait for user approval of plan

### Stage 4: Task Breakdown
9. Run `/tasks` to break down into actionable items
10. **Gate**: Confirm task list is complete

### Stage 5: Implementation
11. Run `/implement` to execute the plan
12. Run `/code_review` to validate the implementation
13. Run `/quality` for correctness verification
14. **Gate**: All tests pass

### Stage 6: Delivery
15. Run `/commit` to stage and commit changes
16. Run `/deploy` to deploy (if applicable)

### Stage 7: Retrospective
17. Run `/retro` to document lessons learned

## Output Format

At each stage transition, summarize:
```markdown
## Stage [N] Complete: [Stage Name]

**Completed**: [What was done]
**Artifacts**: [Files created/modified]
**Next**: [What happens in the next stage]

Proceed to Stage [N+1]? (yes/no)
```

## Handoffs

Each stage automatically suggests the next command. User must approve to continue.
