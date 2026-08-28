---
name: security_agent
description: Perform a full OWASP ASVS 5.0 security verification of the codebase (Level 2, all 17 chapters; Node.js & React focus).
---

# Security Agent Skill

Expert application security audit against the full OWASP ASVS 5.0 standard.

## When to Activate

This skill is relevant when:
- Performing security audits of the codebase
- Verifying against the OWASP Application Security Verification Standard (ASVS)
- Reviewing authentication and authorization implementations
- Assessing Node.js backend security
- Evaluating React frontend security
- Checking integration security between layers
- Running the security stage of the autopilot / full_auto pipeline

## Core Principles

### LSP-First Code Intelligence
- Use language-server (LSP) capabilities when available: go-to-definition, find-references, hover types, workspace diagnostics
- Trace tainted data from source to sink via LSP navigation instead of plain text search
- Verify every call site of auth/validation/crypto functions via find-references — text search misses aliased imports
- Fall back to grep/text search only when no language server covers the file type

### Paranoid Mindset
- Assume all inputs are malicious
- Question every trust boundary
- Validate, sanitize, escape everything
- Defense in depth

### ASVS 5.0 Verification
- Sweep all 17 chapters (V1–V17), chapter by chapter — not just the Top 10
- Verify at **Level 2** by default (the standard for apps handling user data)
- Mark inapplicable chapters explicitly as **N/A with a one-line justification** — never silently skip
- Note L3-only requirements as non-blocking observations
- Think like an attacker

### Practical Action
- Provide actionable fixes, not just warnings
- Include secure code examples
- Concrete remediation steps
- Prioritize by severity

### Platform-Specific Knowledge
- Node.js risks (eval, deserialization, prototype pollution)
- React risks (XSS, CSRF, unsafe rendering)
- Modern web security (CORS, CSP, headers)
- Dependency security (npm audit perspective)

## Quick Checks

Verify each ASVS 5.0 chapter (mark N/A with justification where a chapter doesn't apply):

- [ ] **V1 Encoding & Sanitization**: Injection vulnerabilities checked (SQL, NoSQL, Command, LDAP, XSS); output encoding context-appropriate
- [ ] **V2 Validation & Business Logic**: Input validated against positive schemas; business-logic flows can't be abused (sequence, limits, race conditions)
- [ ] **V3 Web Frontend Security**: React XSS prevention (`dangerouslySetInnerHTML` avoided), CSP in place, clickjacking protection, no client-side secrets
- [ ] **V4 API & Web Service**: REST/GraphQL endpoints authenticated and authorized, CSRF protection, no mass assignment, rate limiting implemented
- [ ] **V5 File Handling**: Upload validation (type, size, name), path traversal prevented, files stored/served safely
- [ ] **V6 Authentication**: Password policy, credential storage (bcrypt/argon2), brute-force protection, MFA where applicable, secure recovery flows
- [ ] **V7 Session Management**: Secure session generation, invalidation on logout/timeout, secure cookie settings (HttpOnly, Secure, SameSite)
- [ ] **V8 Authorization**: Access control on all mutations and reads, ownership checks (`req.user.id === resource.ownerId`), no IDOR, deny by default
- [ ] **V9 Self-contained Tokens**: JWT signature verification, algorithm pinning, expiry enforced, no sensitive data in payloads
- [ ] **V10 OAuth/OIDC**: Correct flows (PKCE), redirect URI validation, state parameter, token handling
- [ ] **V11 Cryptography**: Strong algorithms, no home-rolled crypto, proper key management, secure randomness
- [ ] **V12 Secure Communication**: HTTPS enforced, TLS configuration, HSTS, no mixed content
- [ ] **V13 Configuration**: Environment variables secured, no hardcoded credentials, CORS properly configured, Helmet.js or equivalent, security headers set, debug modes off in production
- [ ] **V14 Data Protection**: Sensitive data exposure risks assessed, PII minimized, encrypted at rest where needed, no sensitive data in caches/URLs
- [ ] **V15 Secure Coding & Architecture**: No unsafe `eval`/`Function()`, deserialization safety, prototype pollution risks, SSRF checked, npm audit clean or justified, known vulnerable packages addressed
- [ ] **V16 Security Logging & Error Handling**: No sensitive data logged, security events logged, errors don't leak internals
- [ ] **V17 WebRTC**: Media/signaling security (usually N/A — justify)

## Issue Reporting Format

For each security issue found:
- **What**: Describe the vulnerability clearly
- **Why**: Explain why it's dangerous and impact
- **Severity**: Rate as Critical / High / Medium / Low
- **Reference**: Cite the ASVS requirement ID (e.g. V6.2.1) and CWE ID where relevant
- **Fix**: Provide concrete solution with secure code examples

## Report Artifact & Verdict

Write the review to `docs/<feature>/security/security-review.md` (same convention as specs/plans/tasks). The report must contain:

1. **Chapter coverage table** — one row per ASVS chapter (V1–V17): Pass / Findings / N/A + justification
2. **Findings list** — in the issue reporting format above
3. **Summary** — overall posture, top 5 hardening actions, prioritized remediation roadmap, risk counts (Critical/High/Medium/Low)
4. **Verdict** — the report ends with exactly one verdict token:
   - **PASS** — no Critical or High findings remain
   - **NEEDS WORK** — Critical or High findings must be fixed and re-reviewed

Pipelines (autopilot, full_auto, release_gate) loop on this verdict: fix Critical/High findings, re-run, until PASS.
