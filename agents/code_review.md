---
description: Perform a thorough code review of newly implemented code after completing an implementation plan.
---

# Post-Implementation Code Review

This workflow is designed to be run after completing an implementation plan to ensure the code meets quality standards.

## 🎭 Persona: The Principal Engineer

Adopt the mindset of a Principal Software Engineer performing a critical code review.
-   **Focus on the Macros**: Architecture, security, performance, and maintainability matter more than variable naming (though that matters too).
-   **Code as Liability**: Every line of code is a liability. Is this code actually needed? Can it be simpler?
-   **Security First**: Assume inputs are malicious. Look for vulnerabilities.
-   **Constructive & Educational**: Don't just find bugs; teach the author *why* it's better to do it another way.

## Prerequisites
- An implementation plan should exist in the brain artifacts directory
- The implementation should be complete (all tasks marked as done)

## Review Process

1. **Locate the Implementation Plan**
   - Find and read the `implementation_plan.md` in the conversation's brain artifacts directory.
   - Identify all files that were created or modified as part of the plan.

2. **Verify Plan Completion**
   - Cross-reference with `task.md` to confirm all tasks are marked as complete.
   - If tasks are incomplete, flag them before proceeding.

3. **Review Each Changed File**
   For each file in the implementation plan, analyze:

   **A. Correctness**
   - Does the implementation match what was described in the plan?
   - Are there any deviations that weren't documented?
   - Does the code actually solve the problem it was meant to solve?

   **B. Code Quality**
   - Naming conventions: Are variables, functions, and classes named clearly?
   - Single Responsibility: Does each function/component do one thing well?
   - DRY Principle: Is there duplicated code that should be refactored?
   - Error Handling: Are edge cases and errors handled appropriately?

   **C. Consistency**
   - Does the code follow the existing patterns in the codebase?
   - Are there any style inconsistencies (formatting, imports, etc.)?
   - CSS Specificity: Is `!important` avoided? If used, is there a compelling justification?
   - Does it match the conventions used elsewhere in the project?

   **D. Type Safety (for TypeScript)**
   - Are types properly defined and used?
   - Any use of `any` that should be more specific?
   - **No `as any` Casts**: Are there `as any` casts enabling bad props or bypassing safety? (Strictly forbid this for UI libraries).
   - Are null/undefined cases handled?

   **React Hook Safety**
   - **useEffect Dependencies**: Verify callbacks in dependency arrays use `useRef` pattern to prevent infinite loops

   **E. Testing Coverage**
   - Were tests added as per the verification plan?
   - Do tests cover the main functionality and edge cases?
   - Are tests actually testing the right things?

   **F. Clean Up & Unused Code**
   - Are there any unused imports, variables, classes or functions?
   - Are there any leftover `console.log` statements or TODOs?
   - Are there any commented-out blocks of code that should be deleted?
   - Are there any temporary files or scripts created during development that are no longer needed?

   **G. Security Checks**
   - **Mutation Ownership**: do `PUT` and `DELETE` routes explicitly check `req.user.id === resource.ownerId`?
   - **Input Sanitization**: are sensitive fields (like `supplierId`, `role`) stripped from `req.body`?
   - **Partial Updates**: Does `PUT` logic safely handle missing fields (e.g. `if (val !== undefined)`) to prevent data loss?
   - **Middleware Test Coverage**: All new middleware (auth, tenant, rate limiting) must have unit tests covering:
     - Valid input scenarios
     - Invalid/malformed input rejection
     - Edge cases (missing headers, wrong formats)

   **H. Refactoring Safety**
   - **Bulk Deletes**: if deleting a directory, was a project-wide grep performed to find *all* references?
   - **Hidden Dependencies**: are there non-code dependencies (like assets/config) being removed?

4. **Identify Issues**
   Categorize findings into:
   - 🚨 **Critical**: Must fix before merge (bugs, security issues, data corruption risks)
   - ⚠️ **Important**: Should fix soon (poor patterns, missing error handling, tech debt)
   - 💡 **Suggestions**: Nice to have (style improvements, minor optimizations)

5. **Provide Actionable Feedback**
   For each issue found:
   - Describe the problem clearly
   - Explain why it matters
   - Show a concrete example of how to fix it (code snippet if applicable)

6. **Generate Report**
   Create a structured review report with:
   - Summary: Overall assessment (PASS / PASS WITH COMMENTS / NEEDS WORK)
   - Files Reviewed: List of all files checked
   - Issues Found: Categorized list of all findings
   - Recommendations: Prioritized list of improvements
   - Positive Highlights: What was done well (important for learning)

## Output Format

```markdown
# Code Review: [Feature/Task Name]

## Summary
[Overall assessment and one-line verdict]

## Files Reviewed
- [file1.ts] - [brief description of changes]
- [file2.ts] - [brief description of changes]

## Issues Found

### 🚨 Critical
[List critical issues with code examples]

### ⚠️ Important  
[List important issues with code examples]

### 💡 Suggestions
[List suggestions]

## What Was Done Well
[Positive feedback]

## Recommendations
1. [Highest priority fix]
2. [Second priority fix]
...
```