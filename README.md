# Agent Templates

A comprehensive collection of AI agent templates designed for software development workflows. These templates can be installed into Antigravity, Cursor, and Claude Code to provide specialized AI assistants for various development tasks.

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/lionbenjamin/agent-templates.git
cd agent-templates

# Install workflows for Antigravity, Cursor, and Claude Code
./install-workflows.sh
```

This will copy all agent templates to:
- `~/.gemini/antigravity/global_workflows/` (for Antigravity workflows)
- `~/.gemini/antigravity/skills/` (for Antigravity skills)
- `~/.cursor/commands/` (for Cursor)
- `~/.claude/commands/` (for Claude Code slash commands)

## 🛠️ Skills

Skills live in `skills/<skill-name>/SKILL.md`. Each skill serves double duty:

- **Antigravity**: Auto-discovered and applied when relevant during coding sessions
- **Claude Code**: Installed as `/command` slash commands via `~/.claude/commands/`

| Skill | Description |
|-------|-------------|
| `a11y_check` | WCAG accessibility compliance |
| `analyze` | Pre-implementation spec/plan/task consistency check |
| `clarify` | Refine requirements and acceptance criteria |
| `code_review` | Security and quality analysis of new code |
| `commit` | Staging and conventional commits |
| `constitute` | Define tech stack and architecture constraints |
| `deploy` | Test, build, and deploy the application |
| `document` | README updates, JSDoc/TSDoc, inline documentation |
| `domain_model` | DDD domain modeling with bounded contexts |
| `feature` | Full SDLC orchestration with approval gates |
| `fix` | Root cause analysis and surgical bug fixes |
| `implement` | TDD-first code generation |
| `janitor` | Code cleanup and maintenance |
| `optimize` | Performance analysis and improvement |
| `plan` | Technical implementation planning |
| `quality` | Correctness verification and audit |
| `release_gate` | Release readiness validation |
| `retro` | Retrospective and workflow improvement |
| `review_constitution` | Challenge and stress-test constraints |
| `review_domain` | Architectural review of domain model |
| `review_plan` | Principal Engineer plan review |
| `security_agent` | Security-focused code analysis (OWASP Top 10) |
| `skeptical_review` | Critical architectural review |
| `specify` | Draft comprehensive product specifications |
| `tasks` | Break down plans into actionable tasks |
| `tech_review` | Technical architecture review |
| `ux_redesign` | User experience redesign |

## 🏗️ Project Setup

- **Step 0**: `/constitute` - Define tech stack & standards (`constitute.md`)
- **Step 0.1**: `/review_constitution` - Challenge & validate constraints (`review_constitution.md`)
- **Step 0.2**: `/domain_model` - Create comprehensive domain model (`domain_model.md`)
- **Step 0.3**: `/review_domain` - Architectural review of domain model (`review_domain.md`)

## 🔄 The Agentic SDLC

- **Step 1**: `/specify` - Draft comprehensive spec (`specify.md`)
- **Step 2**: `/clarify` - Refine requirements & acceptance criteria (`clarify.md`)
- **Step 3**: `/plan` - Create TDD & implementation plan (`plan.md`)
- **Step 4**: `/review_plan` - Principal Engineer architectural review (`review_plan.md`)
- **Step 5**: `/tasks` - Break down plan into actionable tasks (`tasks.md`)
- **Step 6**: `/implement` - TDD-first code generation (`implement.md`)
- **Step 7**: `/code_review` - Security & quality analysis (`code_review.md`)
- **Step 8**: `/quality` - Correctness verification & audit (`quality.md`)
- **Step 9**: `/commit` - Staging & conventional commits (`commit.md`)
- **Step 10**: `/deploy` - Production toggle & deployment (`deploy.md`)
- **Step 11**: `/retro` - Loop feedback to improve instructions (`retro.md`)

> **Tip:** Run `/feature` to orchestrate the entire SDLC with approval gates at each stage.

## 🕵️ Special Agents

- **The Orchestrator**: `/feature` - Full SDLC cycle with approval gates (`feature.md`)
- **The Validator**: `/analyze` - Pre-implementation consistency check (`analyze.md`)
- **The Devil's Advocate**: `/review_constitution` - Challenge & stress-test constraints (`review_constitution.md`)
- **The Skeptic**: `/skeptical_review` - Critical architectural reviews (`skeptical_review.md`)
- **The Security Agent**: `/security_agent` - Security-focused code analysis (`security_agent.md`)
- **The Janitor**: `/janitor` - Code cleanup and maintenance (`janitor.md`)
- **The Doc Agent**: `/document` - Documentation synchronization (`document.md`)
- **The Speed Demon**: `/optimize` - Performance optimization (`optimize.md`)
- **The A11y Agent**: `/a11y_check` - Accessibility compliance (`a11y_check.md`)
- **The Principal Designer**: `/ux_redesign` - User experience design (`ux_redesign.md`)
- **The Design Auditor**: `/design_audit` - Comprehensive UX design audit (`design_audit.md`)
- **The Bug Hunter**: `/fix` - Surgical bug fixing (`fix.md`)
- **The Release Gate**: `/release_gate` - Release readiness validation (`release_gate.md`)
- **Technical Review**: `/tech_review` - Technical architecture review (`tech_review.md`)

## 📋 Project Structure

Each workflow exists in two formats:

| Directory | Format | Used By |
|-----------|--------|---------|
| `agents/*.md` | Full agent templates with persona, prerequisites, and process | Antigravity workflows, Cursor commands |
| `skills/*/SKILL.md` | Claude Code skill format with frontmatter and activation triggers | Claude Code slash commands |

### Agent Template Structure

```yaml
---
description: Brief description of the agent's purpose
handoffs:
  - trigger: /next-command
    label: "Description of next step"
---

## 🎭 Persona: [Role Name]
[Specific mindset and approach the agent should adopt]

## Prerequisites
[Requirements that should be met before running]

## Process
[Step-by-step workflow the agent should follow]

## Output Format
[Expected structure of the agent's response]
```

### Handoffs

SDLC agents include `handoffs` in their frontmatter to suggest the next workflow step:

```
/specify → /clarify → /plan → /review_plan → /tasks → /implement → /code_review → /quality → /commit → /deploy → /retro
```

### Task Markers

When using `/tasks`, you can mark tasks for parallel execution:
- `[P]` — Can run in parallel with other `[P]` tasks
- `[B]` — Blocking; dependencies must complete first

## 🧠 Memory System

Agents persist context across sessions using these files:

| File | Purpose |
|------|---------|
| `technical_constitution.md` | Non-negotiable tech stack and architecture constraints (created by `/constitute`) |
| `docs/process/lessons-learned.md` | Retrospective insights (updated by `/retro`) |
| `RULES.md` | AI-readable rules derived from constitution |

Agents like `/plan` and `/implement` reference these files to ensure consistency.


## 🔧 Customization

### Adding New Workflows

1. Create a new `.md` file in `agents/` following the agent template structure
2. Create a matching `skills/<name>/SKILL.md` for Claude Code support
3. Run `./install-workflows.sh` to deploy

### Modifying Existing Workflows

Edit the files in `agents/` and/or `skills/`, then reinstall:

```bash
./install-workflows.sh
```

## 🎯 Best Practices

### Agent Philosophy

These agents are designed with software craftsmanship principles:

- **Security First**: All agents consider security implications
- **Quality Focus**: Emphasis on maintainable, well-tested code
- **Educational**: Agents explain *why* certain approaches are better
- **Practical**: Actionable feedback with concrete examples

## 🤝 Contributing

1. Fork the repository
2. Add or modify agent templates following the established patterns
3. Test your changes by installing and using the agents
4. Submit a pull request with a clear description

## 📄 License

See [LICENSE](LICENSE) for details.

## ⚡ Turbo Mode

For power users, workflows support turbo annotations to auto-approve safe commands:

- `// turbo` - Auto-run the next step only
- `// turbo-all` - Auto-run ALL steps in the workflow

Example in a workflow:
```markdown
// turbo
3. Run the build command
```

## 💡 Inspiration

This project was inspired by [SpecKit](https://github.com/github/spec-kit), a toolkit by GitHub to help you get started with Spec-Driven Development.

## 🔗 Related Projects

- [Google Antigravity](https://antigravity.google/) - AI-first development environment
- [Cursor](https://cursor.sh/) - AI-first code editor
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Anthropic's CLI for Claude


---

*Built for software teams who value quality, security, and maintainable code.*
