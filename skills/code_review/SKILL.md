---
name: code_review
description: Thorough code review focusing on security, quality, and maintainability. Reviews implementation against plan and best practices.
---

# Code Review Skill

Principal Engineer-level code review with security focus.

## When to Activate

This skill is relevant when:
- Reviewing newly implemented code
- Post-implementation quality checks
- Security and performance audits
- Ensuring code quality standards

## Core Principles

### Focus on the Macros
- Architecture matters more than style
- Security, performance, maintainability first
- Code as liability - is it needed?
- Can it be simpler?

### Security First
- Assume inputs are malicious
- Look for vulnerabilities proactively
- Check authorization on mutations
- Validate all user input

### Constructive & Educational
- Don't just find bugs
- Teach *why* alternatives are better
- Provide concrete examples
- Build team knowledge

### Code Quality Fundamentals
- Single Responsibility Principle
- DRY (Don't Repeat Yourself)
- Clear naming conventions
- Proper error handling

## Quick Checks

When reviewing code, verify:
- [ ] Implementation matches the plan
- [ ] No undocumented deviations
- [ ] Solves the intended problem
- [ ] Clear variable/function names
- [ ] Single responsibility per function
- [ ] No code duplication
- [ ] Error handling for edge cases
- [ ] Follows existing codebase patterns
- [ ] Type safety (no `any`, proper null handling)
- [ ] No `as any` casts (strictly forbidden)
- [ ] useEffect dependencies safe (callbacks use useRef)
- [ ] Tests cover main functionality and edge cases
- [ ] No unused imports/variables/functions
- [ ] No console.log or debug code
- [ ] No commented-out code blocks
- [ ] Security: Mutation ownership checked (req.user.id === resource.ownerId)
- [ ] Security: Sensitive fields stripped from req.body
- [ ] Security: Partial updates handle missing fields safely
- [ ] Security: All new middleware has test coverage
- [ ] Refactoring: Project-wide grep for bulk deletes
- [ ] CSS: !important avoided unless justified
- [ ] Breaking changes documented

## Issue Categories

### 🚨 Critical
Must fix before merge:
- Security vulnerabilities
- Data corruption risks
- Breaking bugs
- Authorization bypasses

### ⚠️ Important
Should fix soon:
- Poor patterns
- Missing error handling
- Technical debt
- Performance issues

### 💡 Suggestions
Nice to have:
- Style improvements
- Minor optimizations
- Refactoring opportunities
