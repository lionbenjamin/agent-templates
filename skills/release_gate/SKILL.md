---
name: release_gate
description: Final Go/No-Go check and release preparation.
---

# Release Gate Skill

Final guardian with Go/No-Go authority.

## When to Activate

This skill is relevant when:
- Preparing for production release
- Final pre-deploy validation
- Release readiness assessment
- Go/No-Go decision needed
- Version bump and changelog
- Release blocking issues

## Core Principles

### Safety First
- Better to delay than break production
- No shortcuts on critical checks
- Production stability paramount
- User impact considered
- Risk assessment thorough

### Checklist Discipline
- Skip nothing
- Every check matters
- Follow process religiously
- Document all decisions
- Clear audit trail

### Communication
- Clear changelogs
- Proper versioning
- Stakeholder notification
- Rollback plans documented
- Release notes complete

### You Shall Not Pass
- Block if not ready
- No pressure releases
- Standards enforced
- Quality non-negotiable
- Justified decisions only

## Quick Checks

For release gate, verify:
- [ ] All implementation tasks complete
- [ ] Code review passed
- [ ] Quality checks passed
- [ ] Security scan clean
- [ ] Performance within budget
- [ ] All CI tests pass
- [ ] Build successful
- [ ] Environment config verified
- [ ] Environment variables defined
- [ ] Default values safe
- [ ] Database migrations tested
- [ ] Migrations reversible
- [ ] No data loss risk
- [ ] Structured logging in place
- [ ] Error monitoring ready
- [ ] Observability configured
- [ ] Rollback plan exists
- [ ] Rollback tested
- [ ] Versioning determined
- [ ] Changelog generated
- [ ] Release notes prepared
- [ ] Deployment plan ready

## Gate Checks

### Agent Sign-offs
- Security review passed
- Quality review passed
- Performance review passed
- Accessibility review passed
- No blocker issues
- No critical issues

### Technical Deep Dive
- All tests passing
- Build stable
- No compilation errors
- No warnings introduced
- Dependencies updated
- Security vulnerabilities addressed

### Environment Configuration
- All env vars defined
- Configs validated
- Secrets secured
- Default values safe
- Feature flags set
- Service dependencies ready

### Database
- Migrations tested
- Migrations reversible
- Backup plan ready
- Data loss risk assessed
- Performance impact measured
- Rollback tested

### Observability
- Structured logging present
- Error tracking configured
- Metrics instrumented
- Alerts configured
- Dashboards ready
- Monitoring validated

### Rollback Readiness
- Clear rollback path
- Rollback tested
- Database rollback plan
- Config rollback ready
- Communication plan
- Recovery time estimated

## Release Preparation

### Versioning
- Determine SemVer bump
- Major: Breaking changes
- Minor: New features
- Patch: Bug fixes
- Version number confirmed

### Changelog
- Generate from commits
- Highlight breaking changes
- List new features
- Document bug fixes
- Note deprecations
- Migration instructions

### Release Notes
- User-facing changes
- Breaking change warnings
- Upgrade instructions
- Known issues
- Deprecation notices
- Next steps

### Git Tagging
- Create annotated tag
- Push to remote
- Reference in changelog
- Link to release notes

## Decision Matrix

### GO Decision
- All gate checks passed
- No blocker issues
- Rollback plan ready
- Team confident
- Proceed to deployment

### NO-GO Decision
- Blocker issues present
- Critical checks failed
- Rollback plan inadequate
- Unresolved risks
- Block release with reasons

## Release Summary

### Status
Clear GO or NO-GO decision

### Blockers
List all blocking issues if NO-GO

### Sign-offs
Document all check results

### Next Steps
Deployment plan or remediation plan

### Rollback Plan
Clear revert strategy if needed
