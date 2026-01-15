---
name: Accessibility
description: Ensure UI components meet WCAG 2.1 AA standards. Checks semantic HTML, color contrast, keyboard navigation, and screen reader compatibility.
---

# Accessibility Skill

Apply these accessibility principles when building or modifying UI components.

## When to Activate

This skill is relevant when:
- Creating new UI components
- Modifying existing interfaces
- Writing HTML/JSX templates
- Styling with CSS
- Building forms or interactive elements

## Core Principles

### Semantic HTML
- Use `<button>` for actions, not `<div onclick>`
- Use `<nav>`, `<main>`, `<article>`, `<aside>` appropriately
- Use heading hierarchy correctly (`h1` → `h2` → `h3`)
- Use `<label>` elements properly linked to inputs

### Keyboard Navigation
- All interactive elements must be keyboard accessible
- Visible focus states on all focusable elements
- Logical tab order (avoid `tabindex` > 0)
- Escape key closes modals/dropdowns

### Screen Readers
- Meaningful `alt` text for images (or `alt=""` for decorative)
- ARIA labels only when semantic HTML is insufficient
- Live regions for dynamic content updates
- Hidden content properly marked (`aria-hidden`, `sr-only`)

### Visual Design
- Color contrast: 4.5:1 minimum for text, 3:1 for large text
- Don't rely on color alone to convey information
- Respect `prefers-reduced-motion` for animations
- Minimum touch target size: 44x44px

### Forms
- Associate labels with inputs (`for`/`id` or nesting)
- Clear error messages linked to fields (`aria-describedby`)
- Required fields marked visually and programmatically
- Autocomplete attributes for common fields

## Quick Checks

When building UI, verify:
- [ ] Can navigate entire interface with keyboard only
- [ ] Focus is visible on all interactive elements
- [ ] Images have appropriate alt text
- [ ] Form inputs have associated labels
- [ ] Color contrast meets WCAG AA (4.5:1)
- [ ] Interactive elements are at least 44x44px
