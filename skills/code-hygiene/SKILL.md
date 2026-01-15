---
name: Code Hygiene
description: Maintain clean, organized code by removing unused items, standardizing structure, and eliminating clutter.
---

# Code Hygiene Skill

Apply these cleanup principles to maintain a clean codebase.

## When to Activate

This skill is relevant when:
- Completing a feature or refactor
- Reviewing code changes
- Noticing accumulated technical debt
- Before committing code

## Core Principles

### Delete the Clutter
- **Unused imports** - remove them immediately
- **Unused variables** - delete if not needed
- **Commented-out code** - delete it (git has history)
- **Dead code paths** - remove unreachable code
- **console.log statements** - remove before commit

### TODOs and FIXMEs
- If addressed, delete the comment
- If still needed, ensure it has context and owner
- Prefer issues/tickets over in-code TODOs

### File Organization
- One component/class per file (generally)
- Related files grouped in directories
- Consistent naming conventions
- Index files for clean exports

### Import Organization
```typescript
// 1. External packages
import React from 'react';
import { useQuery } from '@tanstack/react-query';

// 2. Internal aliases (@/)
import { Button } from '@/components/ui';
import { useAuth } from '@/hooks';

// 3. Relative imports
import { formatDate } from './utils';
import type { Props } from './types';
```

### Duplication
- Extract repeated logic to shared utilities
- Create custom hooks for repeated React patterns
- Use constants for repeated values
- Prefer composition over copy-paste

### Formatting
- Run formatter before commit (Prettier)
- Consistent indentation and spacing
- Line length limits (80-120 chars)
- Trailing commas for cleaner diffs

## Quick Checks

Before completing work, verify:
- [ ] No unused imports or variables
- [ ] No console.log or debugger statements
- [ ] No commented-out code blocks
- [ ] Imports are organized and clean
- [ ] Addressed TODOs are removed
- [ ] Code is formatted consistently
