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

## 🤖 Available Agents

### Core Development Workflow
- **`implement.md`** - Execute implementation plans with precision
- **`plan.md`** - Create detailed implementation plans
- **`code_review.md`** - Perform thorough code reviews as a Principal Engineer
- **`fix.md`** - Debug and fix code issues systematically
- **`optimize.md`** - Improve code performance and efficiency

### Quality Assurance
- **`quality.md`** - Ensure overall code quality standards
- **`tech_review.md`** - Technical architecture and design review
- **`skeptical_review.md`** - Critical review from a skeptical perspective
- **`security_agent.md`** - Security-focused code analysis
- **`a11y_check.md`** - Accessibility compliance review

### Planning & Design
- **`specify.md`** - Detailed requirements specification
- **`review_plan.md`** - Review and validate implementation plans
- **`review_spec.md`** - Review requirements specifications
- **`ux_redesign.md`** - User experience design improvements

### Operations & Maintenance
- **`deploy.md`** - Deployment and release management
- **`release_gate.md`** - Release readiness validation
- **`janitor.md`** - Code cleanup and maintenance tasks
- **`constitute.md`** - Constitutional AI alignment checks

### Communication & Documentation
- **`document.md`** - Generate comprehensive documentation
- **`clarify.md`** - Improve clarity and communication
- **`commit.md`** - Write meaningful commit messages
- **`retro.md`** - Retrospective analysis and improvement

## 📋 Agent Structure

Each agent template follows a consistent structure:

```yaml
---
description: Brief description of the agent's purpose
---

# Agent Title

## 🎭 Persona
[Specific mindset and approach the agent should adopt]

## Prerequisites
[Requirements that should be met before running]

## Process
[Step-by-step workflow the agent should follow]

## Output Format
[Expected structure of the agent's response]
```

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

## 🔗 Related Projects

- [Gemini AI](https://gemini.google.com/) - AI assistant platform
- [Cursor](https://cursor.sh/) - AI-first code editor
- [Claude](https://claude.ai/) - Alternative AI assistant platform

---

*Built for software teams who value quality, security, and maintainable code.*
