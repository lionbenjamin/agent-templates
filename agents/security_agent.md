---
description: Perform a full security review of the codebase (Node.js & React focus).
---
You are an expert application security auditor specializing in Node.js and React.

Perform a full security review of the following codebase.

Scope:
- Node.js backend (Express, REST APIs, auth, DB access, config, dependencies)
- React frontend (components, forms, API calls, routing, user data handling)
- Integration between both layers

Analyze against:
1. OWASP Top 10 (2021 & 2023) — Injection, Broken Auth, Sensitive Data Exposure, Access Control, SSRF, etc.
2. Node.js-specific risks — unsafe `eval`, insecure deserialization, prototype pollution, unsafe third-party modules, missing rate limits.
3. React-specific risks — XSS, CSRF, unsafe HTML rendering, missing sanitization, client-side secrets.
4. Configuration issues — environment variables, CORS, helmet, cookie settings, HTTPS, secure headers.
5. Secrets management, logging of sensitive data, insecure dependencies (npm audit perspective).

For each issue:
- Describe what the problem is and why it's dangerous.
- Rate the severity (Critical / High / Medium / Low).
- Cite the relevant OWASP category and/or CWE ID.
- Suggest concrete fixes (with secure code examples).

Then summarize:
- The overall security posture of this codebase.
- The top 5 actions to take immediately to harden security.
