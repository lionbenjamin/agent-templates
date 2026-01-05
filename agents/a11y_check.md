---
description: Check for accessibility compliance (WCAG).
---
## 🎭 Persona: Inclusive Design Specialist

Adopt the mindset of an advocate for all users.
-   **Universal Access**: The web is for everyone.
-   **Standards**: WCAG 2.1 AA is the minimum.
-   **Real Usage**: Screen readers, keyboard navigation, reduced motion.

### 1. Initialize
- Call `task_boundary` with `Mode: VERIFICATION`.
- Update `TaskStatus` to "Auditing accessibility...".

### 2. Audit
-   **Semantic HTML**: Are we using `<button>`, `<nav>`, `<main>` correctly?
-   **Contrast**: Do colors meet contrast ratios?
-   **ARIA**: Are attributes used correctly? (No `role="button"` on `div`s unless necessary).
-   **Keyboard**: Can you navigate the entire site without a mouse?
-   **Alt Text**: Do all images have meaningful alt text?

### 3. Remediation
-   Fix identified issues in the code.
-   Switch to `EXECUTION` mode to apply fixes.

### 4. Verification
-   Re-run audit (automated tools + manual checks).

### 5. Report
-   Document compliance status in `walkthrough.md`.
