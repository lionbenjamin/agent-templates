---
name: Security Review
description: Automatically apply security best practices when writing or reviewing code. Checks for OWASP Top 10 vulnerabilities, Node.js/React-specific risks, and secure coding patterns.
---

# Security Review Skill

Apply these security principles automatically when writing or modifying code.

## When to Activate

This skill is relevant when:
- Writing backend API endpoints or routes
- Handling user input or form data
- Implementing authentication/authorization
- Working with databases or external services
- Reviewing code changes

## Core Principles

### Input Validation
- **Assume all inputs are malicious** - sanitize and validate everything
- Strip sensitive fields (`role`, `isAdmin`, `ownerId`) from request bodies
- Use allowlists, not blocklists for input validation

### Authentication & Authorization
- Always verify `req.user.id === resource.ownerId` for mutations
- Check authorization at the route level, not just middleware
- Never trust client-side role/permission claims

### Data Exposure
- Never log sensitive data (passwords, tokens, PII)
- Use parameterized queries - never string concatenation for SQL
- Validate and escape all output to prevent XSS

### Node.js Specifics
- Avoid `eval()`, `Function()`, and similar dynamic execution
- Use `helmet` middleware for security headers
- Implement rate limiting on auth endpoints
- Validate JSON payloads to prevent prototype pollution

### React Specifics
- Never use `dangerouslySetInnerHTML` with user content
- Avoid storing secrets in client-side code
- Sanitize data before rendering

## Quick Checks

When reviewing code, verify:
- [ ] No hardcoded secrets or API keys
- [ ] Input validation on all user-provided data
- [ ] Authorization checks on protected routes
- [ ] Parameterized database queries
- [ ] Appropriate error messages (no stack traces to users)
- [ ] Secure cookie settings (`httpOnly`, `secure`, `sameSite`)
