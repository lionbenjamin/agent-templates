# Agent Templates

A comprehensive collection of AI agent templates designed for software development workflows. These templates can be installed into Gemini and Cursor IDEs to provide specialized AI assistants for various development tasks.

## 🚀 Quick Start

```bash
# Clone the repository
git clone <repository-url>
cd agent-templates

# Install workflows for both Antigravity and Cursor
./install-workflows.sh
```

This will copy all agent templates to:
- `~/.gemini/antigravity/global_workflows/` (for Antigravity)
- `~/.cursor/commands/` (for Cursor)

## 🏗️ Project Setup

- **Step 0**: `/constitute` - Define tech stack & standards (`constitute.md`)

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
- **The Skeptic**: `/skeptical_review` - Critical architectural reviews (`skeptical_review.md`)
- **The Security Agent**: `/security_agent` - Security-focused code analysis (`security_agent.md`)
- **The Janitor**: `/janitor` - Code cleanup and maintenance (`janitor.md`)
- **The Doc Agent**: `/document` - Documentation synchronization (`document.md`)
- **The Speed Demon**: `/optimize` - Performance optimization (`optimize.md`)
- **The A11y Agent**: `/a11y_check` - Accessibility compliance (`a11y_check.md`)
- **The Principal Designer**: `/ux_redesign` - User experience design (`ux_redesign.md`)
- **The Bug Hunter**: `/fix` - Surgical bug fixing (`fix.md`)
- **The Release Gate**: `/release_gate` - Release readiness validation (`release_gate.md`)
- **Technical Review**: `/tech_review` - Technical architecture review (`tech_review.md`)

## 📋 Agent Structure

Each agent template follows a consistent structure:

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

### Adding New Agents

1. Create a new `.md` file in the `agents/` directory
2. Follow the standard template structure
3. Include a clear description, persona, and process
4. Run `./install-workflows.sh` to deploy

### Modifying Existing Agents

Edit the corresponding `.md` file in the `agents/` directory, then reinstall:

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

- [Gemini AI](https://gemini.google.com/) - AI assistant platform
- [Cursor](https://cursor.sh/) - AI-first code editor
- [Claude](https://claude.ai/) - Alternative AI assistant platform

---

*Built for software teams who value quality, security, and maintainable code.*
