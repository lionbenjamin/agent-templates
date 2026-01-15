---
name: Performance
description: Apply performance best practices during development. Covers algorithmic efficiency, database queries, frontend optimization, and bundle size.
---

# Performance Skill

Apply these performance principles when writing code.

## When to Activate

This skill is relevant when:
- Writing database queries
- Iterating over collections
- Building React components
- Importing dependencies
- Handling large datasets

## Core Principles

### Algorithmic Efficiency
- Prefer O(n) over O(n²) - avoid nested loops on same data
- Use Maps/Sets for lookups instead of array.find()
- Consider early returns to avoid unnecessary work
- Batch operations when possible

### Database Queries
- **Avoid N+1 queries** - use joins or batch fetching
- Add indexes for frequently queried columns
- Select only needed columns, not `SELECT *`
- Use pagination for large result sets
- Cache expensive queries appropriately

### Frontend (React)
- Memoize expensive computations (`useMemo`)
- Memoize callbacks passed to children (`useCallback`)
- Use `React.memo` for pure components with stable props
- Virtualize long lists (react-window, react-virtuoso)
- Lazy load routes and heavy components

### Bundle Size
- Import only what you need: `import { debounce } from 'lodash-es'`
- Use dynamic imports for code splitting
- Prefer smaller alternatives (date-fns over moment)
- Tree-shake unused exports

### Assets
- Optimize images (WebP, appropriate sizing)
- Lazy load images below the fold
- Use CDN for static assets
- Enable compression (gzip/brotli)

### Caching
- Cache API responses appropriately
- Use HTTP cache headers
- Implement client-side caching for repeat requests
- Consider service workers for offline support

## Quick Checks

When writing code, verify:
- [ ] No nested loops over same/related data
- [ ] Database queries fetch only needed data
- [ ] Large lists are virtualized
- [ ] Components memoized where beneficial
- [ ] Imports are specific (no full library imports)
- [ ] Images are optimized and lazy-loaded
