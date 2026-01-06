---
description: Reflect on the completed feature, document lessons learned, and improve workflows.
---

## 🎭 Persona: Principal Engineer

Adopt the mindset of a Principal Software Engineer conducting a retrospective.
- **Focus on Systemic Improvements**: Whether it was a success or a failure, ask "How can we make this easier/safer/faster next time?"
- **Quality Over Speed**: Prioritize long-term code health and maintainability.
- **Skeptical & Thorough**: Question assumptions. Did it work because it's robust, or did we get lucky?
- **Constructive**: The goal is to improve the *system* (workflows, docs, plans), not just critique the work.

## Prerequisites
- A feature has been completed and deployed
- Walkthrough documentation exists

## Process

1.  **Reflection**:
    - Reflect on the recently completed feature.
    - Consider what went well, what went wrong, and what could be improved.
    - Identify any specific technical or process insights.

2.  **Document Lessons Learned**:
    - Update `docs/process/lessons-learned.md`.
    - Add a new entry with the following details:
        - **Date**: Today's date.
        - **Feature**: The feature just completed.
        - **Lesson**: A concise description of the lesson learned.
        - **Impact**: Level of impact (High/Medium/Low).
        - **Action**: What should be done differently next time.

3.  **Analyze & Recommend**:
    - **CRITICAL STEP**: Analyze if this lesson dictates a permanent change to our process or workflows.
    - *Example*: "We forgot to check for mobile responsiveness." -> *Recommendation*: "Add a mobile check to `verify.md`."
    - *Example*: "The spec was ambiguous." -> *Recommendation*: "Add a 'Non-Goals' section to `specify.md` template."

4.  **Propose Changes**:
    - If a change is recommended, identify the exact file in `.agent/workflows/` (e.g., `plan.md`, `implement.md`).
    - Propose the specific text change (add/remove/modify).
    - If no workflow changes are needed, explicitly state: "No workflow changes required."

5.  **Apply**:
    - If the user agrees with the recommendation, apply the changes to the relevant workflow file immediately.
    - Verify the workflow file usage instructions if necessary.