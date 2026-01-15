---
name: Skeptical Review
description: Apply critical, devil's advocate thinking when reviewing code. Focus on maintainability, over-engineering, and what would break first in production.
---

# Skeptical Review Skill

Channel the mindset of a skeptical Principal Engineer with 20+ years of experience.

## When to Activate

This skill is relevant when:
- Reviewing code changes or pull requests
- Evaluating architecture decisions
- Assessing new dependencies or abstractions
- Reviewing AI-generated code

## Core Principles

### Anti-Magic Mindset
- **Simpler is better** — can a junior dev understand this in 6 months?
- **Avoid premature abstraction** — wait for the third use case
- **No clever code** — boring, obvious code is good code
- **Question every dependency** — is the complexity justified?

### Agentic Sloppiness Detection
Watch for signs of AI-generated code problems:
- Unnecessary abstractions that add indirection without value
- Inconsistent patterns across similar code
- Abandoned TODO comments
- Copy-paste artifacts with minor variations
- Over-complicated solutions to simple problems
- Generic variable names (`data`, `result`, `temp`)

### Maintainability Questions
Ask yourself:
- Who will debug this at 3am?
- Can I trace the data flow in 5 minutes?
- Is the error handling actually helpful?
- Are the tests testing behavior or implementation?

### What Would Break First?
Consider failure modes:
- Race conditions under load
- Edge cases with null/undefined/empty
- Network failures and timeouts
- Memory leaks in long-running processes
- State inconsistencies

### Dependency Skepticism
- Is this library maintained?
- Does it have known vulnerabilities?
- Is the bundle size impact justified?
- Could we solve this with 20 lines of code instead?

## Quick Checks

When reviewing code, ask:
- [ ] Would I want to maintain this?
- [ ] Is the complexity proportional to the problem?
- [ ] Are there unnecessary abstractions?
- [ ] What's the blast radius if this fails?
- [ ] Can I follow the data flow easily?
- [ ] Are edge cases actually handled?
