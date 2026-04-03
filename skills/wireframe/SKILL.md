---
name: wireframe
description: Create markdown wireframes with detailed UX descriptions from a product specification. Senior UX Designer perspective inspired by Notion and Linear.
---

# Wireframe Skill

Senior UX Designer creating low-fidelity wireframes as markdown with comprehensive UX descriptions.

## When to Activate

This skill is relevant when:
- Creating UX wireframes for new features from a specification
- Designing screen layouts and user flows before implementation
- Documenting interaction patterns, states, and keyboard shortcuts
- Defining information architecture and content hierarchy
- Bridging the gap between product spec and technical plan

## Core Principles

### Clarity Over Cleverness
- Every element communicates its purpose instantly
- No mystery meat navigation or ambiguous icons
- Labels over icons where possible
- Self-evident hierarchy

### Calm Interface
- Interfaces feel quiet and spacious, not busy
- Noise is a design failure
- Whitespace is a feature, not waste
- Monochrome confidence over colour overload

### Progressive Disclosure
- Show only what matters now
- Reveal complexity on demand
- P1 content always visible, P2 one click away, P3 in overflow
- Empty states guide users to first action

### Keyboard-First
- Every action reachable without a mouse
- Shortcuts for power users on all primary actions
- Command palette as escape hatch
- Focus management is a first-class concern

### Design Inspirations
- **Notion**: Block composability, elegant empty states, typography-driven hierarchy
- **Linear**: Speed and density without clutter, keyboard-driven, opinionated defaults
- **Vercel**: Developer-grade precision, status-driven dashboards

## Quick Checks

When creating wireframes, verify:
- [ ] All screens from the specification are covered
- [ ] Information architecture defined (screen inventory, navigation model)
- [ ] Content hierarchy established (P1/P2/P3 per screen)
- [ ] ASCII wireframes use clear box-drawing notation
- [ ] Every screen has a UX description with purpose and entry points
- [ ] Layout rationale explained for each screen
- [ ] Interactions documented (click, hover, focus, drag)
- [ ] Keyboard shortcuts defined for primary actions
- [ ] Empty state designed and guides user to first action
- [ ] Loading state (skeleton) described
- [ ] Error state surfacing method defined (inline, toast, banner)
- [ ] Responsive behaviour noted
- [ ] Accessibility: focus order, ARIA roles, screen reader announcements
- [ ] Component inventory lists all distinct UI components
- [ ] Component states defined (default, hover, selected, disabled, dragging)
- [ ] User flows documented (happy path, error recovery, power user path)
- [ ] Open questions listed for unresolved UX decisions
- [ ] No colours, exact fonts, or pixel values — layout and hierarchy only
- [ ] Wireframe saved to `docs/<version>/wireframes/<feature-slug>-wireframe.md`

## Wireframe Process

### 1. Read the Specification
- Understand user goals, acceptance criteria, and edge cases
- Identify core flows and distinct screens needed
- Ask if anything is ambiguous

### 2. Define Information Architecture
- Screen inventory with purpose and entry points
- Navigation model (sidebar, tabs, breadcrumbs, modals)
- Content hierarchy per screen (P1 always visible, P2 one click, P3 overflow)
- State map per screen (empty, loading, populated, error, success)

### 3. Wireframe Each Screen
- ASCII wireframe using box-drawing characters
- UX description: purpose, entry points, layout rationale, interactions
- Keyboard shortcuts table
- All states: empty, loading, error, populated
- Responsive behaviour and accessibility notes
- Component inventory with states

### 4. Define Flows
- Happy path (most common journey)
- Error/recovery flows
- Power user keyboard paths

### 5. Document Design Decisions
- Map principles to specific choices made
- List open questions needing product input

## ASCII Wireframe Notation

```
┌─┐│└─┘     Containers and panels
╔═╗║╚═╝     Primary/focused elements
[ Button ]   Interactive elements
( Radio )    Radio buttons
[x] Checkbox Checkboxes
───          Dividers
...          Truncated content
▼            Dropdowns
☰            Menus
← →          Navigation
◉ / ○        Selected / unselected
█            Placeholder images/avatars
░░░░         Skeleton loading states
```
