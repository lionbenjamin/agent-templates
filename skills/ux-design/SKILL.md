---
name: UX Design
description: Apply UX best practices when building user interfaces. Covers Nielsen's heuristics, visual hierarchy, accessibility, and modern design principles.
---

# UX Design Skill

Apply user experience principles when building or modifying interfaces.

## When to Activate

This skill is relevant when:
- Creating new UI components
- Building forms or interactive flows
- Designing page layouts
- Implementing navigation

## Core Principles

### Nielsen's 10 Heuristics
Apply these when evaluating any interface:

1. **Visibility of system status** — Always show loading states, progress, confirmations
2. **Match system & real world** — Use user's language, not technical jargon
3. **User control & freedom** — Provide clear exits, undo, cancel actions
4. **Consistency & standards** — Similar things behave similarly
5. **Error prevention** — Disable invalid actions, confirm destructive ones
6. **Recognition over recall** — Show options, don't require memorization
7. **Flexibility & efficiency** — Shortcuts for power users
8. **Aesthetic & minimalist** — Remove visual noise
9. **Help users recover from errors** — Helpful error messages
10. **Help & documentation** — Guidance when needed

### Visual Hierarchy
- **Primary action** = most prominent (filled button, strong color)
- **Secondary action** = less prominent (outlined, muted)
- **Tertiary action** = least prominent (text link, icon only)
- Use whitespace to group related elements
- Guide the eye with size, color, and position

### Form Design
- One column layout preferred
- Labels above inputs (not inline)
- Show validation inline, as user types
- Disable submit until form is valid
- Clear success/error feedback

### Information Density
- Progressive disclosure — show more only when needed
- Prioritize the 80% use case
- Hide complexity behind "Advanced" or "More options"
- Empty states with helpful guidance

### Modern Patterns
- Skeleton loaders over spinners
- Optimistic updates with rollback
- Inline editing over modal forms
- Toast notifications for async feedback

## Quick Checks

When building UI, verify:
- [ ] Loading and error states handled
- [ ] Primary action is visually obvious
- [ ] User can undo/cancel destructive actions
- [ ] Form validation is inline and helpful
- [ ] Empty states guide the user
- [ ] Interface works without JavaScript (progressive enhancement)
