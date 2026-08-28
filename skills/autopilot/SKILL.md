---
name: autopilot
description: Autonomous pipeline — specify, clarify, plan, review, tasks, implement, code review, security review, QA. Every stage runs in its own sub-agent. No manual gates. Skips stages already completed.
---

# Autopilot Skill

Run the full idea-to-implementation pipeline autonomously, skipping stages already completed, and self-correcting at each review stage. Every stage is delegated to its own sub-agent; the orchestrator routes file paths, findings, and verdicts.

## When to Activate

This skill is relevant when:
- The user wants to go from an idea or feature request to working code in one shot
- The user says "autopilot", "just build it", "end to end", "full pipeline", or "plan through implementation"
- The user wants to skip manual approval gates and let the agent self-correct
- The user has a rough idea and wants the agent to handle everything from specification to QA

## Core Principles

### Zero Manual Gates
- Run the entire pipeline without pausing for user approval.
- Only escalate to the user for critical issues that cannot be autonomously resolved (ambiguous requirements, business decisions, or review loops that hit the max iteration limit).

### Sub-Agent Delegation
- Every stage — and every review/fix iteration — runs in its own fresh sub-agent (Task/Agent tool).
- Sub-agent prompts are self-contained: feature description, artifact file paths, and the command to run. Sub-agents share no context.
- Sub-agents return artifact paths, verdict tokens, and findings — never whole files. The orchestrator keeps only paths, verdicts, and open findings.
- Decisions (skip detection, answering clarification questions, loop control, escalation) stay with the orchestrator.
- Sub-agents that touch or validate code (implement, code review, security review, QA, fix iterations) are instructed to use LSP capabilities (go-to-definition, find-references, rename, diagnostics) when available, falling back to text search otherwise.
- Fresh sub-agent contexts replace the old context-clear checkpoints. If no sub-agent mechanism exists, run stages inline in the same order.

### Smart Skip
- Check what's already been done before starting each stage.
- Spec exists? Skip `/specify`. Spec + clarification record exists? Skip `/clarify`. Plan exists? Skip `/plan`. Etc.
- A spec file alone is NOT enough to skip clarification — the clarification pass must have been explicitly recorded.
- Announce which stages are skipped and why.

### Self-Correcting
- When a review finds issues, fix them immediately — don't stop and ask.
- Loop reviews up to the max iteration limit. Escalate to user only if ambiguous or product-level.

### Plan Is the Contract
- Always plan before coding. Never jump straight to implementation.
- Fix the plan when the review says so, then proceed.

### Quality Without Gatekeeping
- Every stage gets reviewed. No shortcuts.
- Reviews are checkpoints, not stop signs — fix and move on.

### Ship-Ready Output
- The goal is reviewed, working code ready for `/commit`.

## Pipeline

Each numbered stage runs in a dedicated sub-agent; review→fix loops spawn a fresh sub-agent per iteration.

1. `/specify` — draft the product specification *(skip if spec file exists)*
2. `/clarify` — review spec for completeness → orchestrator self-answers questions → fix sub-agent applies decisions → re-review until clean *(skip if clarification already recorded in spec)*
3. `/planning` — draft the implementation plan *(skip if plan file exists)*
4. `/review_plan` — critique the plan → fix sub-agent → re-review until APPROVED *(skip if plan already has APPROVED verdict)*
5. `/tasks` — break down into actionable tasks *(skip if tasks file exists)*
6. `/implement` — execute the plan
7. `/code_review` — review the code → fix sub-agent → re-review until PASS
8. `/security_agent` — full ASVS 5.0 security verification (L2, all 17 chapters) → fix Critical/High findings → re-review until PASS *(skip if security report with PASS verdict exists and no implementation happened this session)*
9. `/quality` — comprehensive QA → fix sub-agent → re-run until PASS

## Quick Checks

When running autopilot, verify:
- [ ] Feature idea or description exists before starting
- [ ] Every stage ran in its own sub-agent (or inline fallback was noted)
- [ ] Sub-agent prompts were self-contained (feature description + artifact paths + command)
- [ ] Skipped stages are announced with clear reason
- [ ] Spec addresses the user's core need and all key user flows
- [ ] Clarification questions are self-answered using judgment (not escalated unless truly ambiguous)
- [ ] Plan addresses all spec requirements
- [ ] Plan review issues are fixed (not just acknowledged)
- [ ] Tasks cover every item in the plan
- [ ] Implementation follows the plan strictly
- [ ] Code review critical/important issues are all resolved
- [ ] Security review Critical/High findings are all resolved (ASVS PASS verdict)
- [ ] QA blocker/critical/major issues are all resolved
- [ ] No review loop exceeded its max iterations
- [ ] Final summary includes spec, plan, tasks paths and all created/modified files
