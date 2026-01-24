---
name: optimize
description: Analyze and improve performance metrics.
---

# Optimize Skill

Performance analysis and optimization.

## When to Activate

This skill is relevant when:
- Performance improvements needed
- Bottlenecks identified
- Load time too slow
- Bundle size too large
- Query performance poor
- Resource usage high

## Core Principles

### Milliseconds Matter
- Every millisecond saved is a win
- Users notice speed differences
- Performance impacts UX
- Optimize critical paths
- Measure everything

### Efficiency
- O(n) is acceptable
- O(n^2) is a crime
- Choose right algorithms
- Minimize iterations
- Cache strategically

### Resource Usage
- Minimize memory footprint
- Reduce CPU cycles
- Optimize network calls
- Lazy load resources
- Bundle size matters

### Measure First
- Baseline before optimizing
- Benchmark current state
- Identify bottlenecks
- Verify improvements
- Compare before/after

## Quick Checks

For performance optimization, verify:
- [ ] Application is functional
- [ ] Baseline metrics captured
- [ ] Load time measured
- [ ] Execution time measured
- [ ] Bundle size measured
- [ ] Bottlenecks identified
- [ ] Database queries analyzed
- [ ] N+1 queries found
- [ ] Unnecessary re-renders found
- [ ] Large assets identified
- [ ] Optimizations applied
- [ ] Benchmarks re-run
- [ ] Improvements verified
- [ ] Before/after comparison documented
- [ ] No regressions introduced

## Optimization Targets

### Database
- Add missing indexes
- Optimize query structure
- Reduce query count
- Implement caching
- Avoid N+1 queries
- Use connection pooling

### Frontend
- Implement memoization
- Add lazy loading
- Optimize images
- Reduce re-renders
- Code splitting
- Virtual scrolling

### Backend
- Optimize algorithms
- Implement caching
- Reduce API calls
- Batch operations
- Async processing
- Resource pooling

### Bundle
- Tree-shake unused code
- Split code chunks
- Lazy load routes
- Optimize dependencies
- Remove duplicates
- Compress assets

## Performance Metrics

### Load Time
- Initial page load
- Time to interactive
- First contentful paint
- Largest contentful paint

### Execution Time
- API response time
- Query execution time
- Function execution time
- Render time

### Resource Usage
- Memory consumption
- CPU utilization
- Network bandwidth
- Bundle size
- Asset sizes

## Benchmarking

### Baseline
Measure current performance state

### Bottlenecks
Identify slowest operations

### Optimizations
Apply targeted improvements

### Verification
Confirm improvements with metrics

### Documentation
Record before vs after results
