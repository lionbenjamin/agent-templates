---
name: a11y_check
description: Check for accessibility compliance (WCAG).
---

# A11y Check Skill

Accessibility audit and compliance verification.

## When to Activate

This skill is relevant when:
- Auditing accessibility compliance
- Reviewing UI components
- Checking WCAG compliance
- Ensuring inclusive design
- Pre-release accessibility check
- Responding to accessibility issues

## Core Principles

### Universal Access
- The web is for everyone
- No user left behind
- Design inclusively
- Remove barriers
- Enable all users

### Standards
- WCAG 2.1 AA is minimum
- Follow established guidelines
- Meet legal requirements
- Industry best practices
- Continuous compliance

### Real Usage
- Test with screen readers
- Verify keyboard navigation
- Check reduced motion
- Test zoom levels
- Validate color contrast

### Semantic First
- Use proper HTML elements
- Meaningful structure
- Logical document flow
- Correct landmark usage
- Accessible names

## Quick Checks

For accessibility audit, verify:
- [ ] Semantic HTML used correctly
- [ ] Buttons are `<button>` elements
- [ ] Navigation uses `<nav>`
- [ ] Main content in `<main>`
- [ ] Headers are hierarchical
- [ ] Color contrast meets ratios
- [ ] Text contrast ≥ 4.5:1
- [ ] Large text contrast ≥ 3:1
- [ ] ARIA attributes used correctly
- [ ] No `role="button"` on divs unnecessarily
- [ ] Keyboard navigation works
- [ ] Tab order is logical
- [ ] Focus indicators visible
- [ ] No keyboard traps
- [ ] All images have alt text
- [ ] Alt text is meaningful
- [ ] Forms have labels
- [ ] Error messages accessible
- [ ] Interactive elements accessible

## Accessibility Audit Areas

### Semantic HTML
- Proper element usage
- Document structure
- Landmark regions
- Heading hierarchy
- List markup
- Table structure

### Contrast
- Text color contrast
- Background contrast
- Focus indicator contrast
- Interactive element contrast
- Error state contrast
- Disabled state clarity

### ARIA
- Correct role usage
- Proper attributes
- State management
- Live regions
- Labels and descriptions
- Hidden content handling

### Keyboard Navigation
- Tab order logical
- All interactive elements reachable
- Focus visible
- Keyboard shortcuts
- No traps
- Skip links present

### Alternative Text
- Images have alt text
- Alt text meaningful
- Decorative images marked
- Complex images described
- Icons labeled
- SVGs accessible

### Forms
- Labels associated
- Required fields indicated
- Error messages clear
- Validation accessible
- Field instructions provided
- Group related fields

## WCAG 2.1 AA Requirements

### Perceivable
- Text alternatives
- Time-based media
- Adaptable content
- Distinguishable elements

### Operable
- Keyboard accessible
- Enough time
- Seizure prevention
- Navigable
- Input modalities

### Understandable
- Readable text
- Predictable operation
- Input assistance
- Error prevention

### Robust
- Compatible with assistive tech
- Valid markup
- Name, role, value
- Status messages

## Remediation Priority

### Critical
- Keyboard navigation broken
- Missing form labels
- Insufficient contrast
- Missing alt text

### High
- Incorrect ARIA usage
- Improper heading structure
- Focus management issues
- Screen reader problems

### Medium
- Minor contrast issues
- Missing landmarks
- Suboptimal tab order
- Enhancement opportunities

### Low
- Style improvements
- Enhanced descriptions
- Additional hints
- Nice to have fixes
