# Convert Workflows to Claude Code Skills - Implementation Plan

## Goal

Convert all 27 agent workflow files from `agents/` directory to Claude Code skills format, update the installation script to target Claude Code's skills directory, and update documentation to reflect the new structure.

**Critical Constraint**: Preserve exact agent filenames as skill names to maintain slash command compatibility (e.g., `/plan`, `/commit`, `/a11y_check` must continue to work exactly as before).

## User Review Required

> [!IMPORTANT]
> - This conversion will restructure the entire project from Antigravity/Gemini workflows to Claude Code skills
> - Skills have a different activation model: auto-activated based on context vs. explicit `/command` invocation
> - Some agents (like `/feature`, `/commit`) are better suited as user-invocable skills rather than auto-activated skills
> - Need to decide which agents should be:
>   - **User-invocable skills** (workflow-like, explicit invocation): feature, commit, deploy, etc.
>   - **Auto-activated skills** (best practices, guidelines): security-review, accessibility, performance, etc.
>   - **Hybrid** (can be both): code_review, quality, plan, etc.

## Scope Analysis

### Agents to Convert (27 total)

**SDLC Workflow Agents** (should remain user-invocable):
1. feature - Full SDLC orchestrator
2. specify - Product specification creation
3. clarify - Specification review
4. plan - Technical implementation planning
5. review_plan - Architectural review of plans
6. tasks - Task breakdown
7. implement - Code implementation
8. code_review - Post-implementation review
9. quality - Correctness verification
10. commit - Git staging and commits
11. deploy - Production deployment
12. retro - Retrospective analysis

**Project Setup Agents** (should remain user-invocable):
13. constitute - Define technical constitution
14. review_constitution - Challenge constraints
15. domain_model - Create domain model
16. review_domain - Review domain model

**Utility Agents** (should remain user-invocable):
17. analyze - Validate spec → plan → tasks consistency
18. document - Documentation synchronization
19. fix - Bug fixing
20. janitor - Code cleanup
21. optimize - Performance optimization
22. a11y_check - Accessibility compliance check
23. release_gate - Release readiness validation

**Special Review Agents** (could be user-invocable OR auto-activated):
24. security_agent - Security analysis
25. skeptical_review - Critical review
26. tech_review - Technical architecture review
27. ux_redesign - UX design review

## Proposed Structure

```
agent-templates/
├── skills/                          # Claude Code skills
│   ├── feature/
│   │   └── SKILL.md
│   ├── specify/
│   │   └── SKILL.md
│   ├── plan/
│   │   └── SKILL.md
│   ├── commit/
│   │   └── SKILL.md
│   ... (all 27 agents)
│
├── agents/                          # Keep for reference/backup
│   └── *.md files (27 files)
│
├── install-workflows.sh             # Updated to install to ~/.claude/skills/
└── README.md                        # Updated documentation
```

## TDD Strategy

Since this is primarily a conversion and restructuring task, traditional unit tests don't apply. However, we will:
- [ ] Verify all 27 skills are created with proper SKILL.md format
- [ ] Test installation script creates directories correctly
- [ ] Verify skills appear in Claude Code's skill list after installation
- [ ] Manual verification: invoke each skill to ensure it works

## Proposed Changes

### Phase 1: Create Skills Directory Structure

#### [NEW] Create base skills directory
```bash
mkdir -p skills
```

#### [NEW] Create individual skill directories (27 total)
For each agent in agents/:
```bash
mkdir -p skills/{skill_name}/
```

### Phase 2: Convert Agent Files to Skills

#### [NEW] skills/*/SKILL.md (27 files)
Convert each agent/*.md file to skills/{name}/SKILL.md format:

**Conversion mapping:**
- Extract `description` from frontmatter → use in SKILL.md frontmatter
- Extract agent name from filename → use as `name` in SKILL.md frontmatter
- Transform agent structure:
  - "Persona" section → "Core Principles" (distill key mindset points)
  - "Prerequisites" → "When to Activate" (context triggers)
  - "Process" steps → "Quick Checks" (verification checklist)
  - "Output Format" → Can be included in skill guidance if relevant
- Remove workflow-specific items:
  - Remove API calls like `task_boundary`, `notify_user`
  - Remove `handoffs` from frontmatter (those are workflow-specific)
  - Simplify to guidance and principles

**Naming Convention:**
- **CRITICAL**: Preserve original agent filenames for slash command consistency
- Skill directory name MUST match agent filename (without .md extension)
- This ensures `/plan`, `/commit`, `/a11y_check`, etc. continue to work exactly as before
- Examples:
  - agents/plan.md → skills/plan/SKILL.md (invoked as `/plan`)
  - agents/commit.md → skills/commit/SKILL.md (invoked as `/commit`)
  - agents/a11y_check.md → skills/a11y_check/SKILL.md (invoked as `/a11y_check`)
  - agents/code_review.md → skills/code_review/SKILL.md (invoked as `/code_review`)
  - agents/domain_model.md → skills/domain_model/SKILL.md (invoked as `/domain_model`)

### Phase 3: Update Installation Script

#### [MODIFY] install-workflows.sh

**Changes needed:**
1. Update target directory from Gemini/Cursor to Claude Code:
   ```bash
   # OLD
   GEMINI_WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
   GEMINI_SKILLS_DIR="$HOME/.gemini/antigravity/skills"
   CURSOR_DIR="$HOME/.cursor/commands"

   # NEW
   CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
   ```

2. Update installation logic:
   ```bash
   # Remove Gemini/Cursor installation code
   # Add Claude Code skills installation
   for skill_dir in "$SKILLS_DIR"/*/; do
       if [ -d "$skill_dir" ]; then
           skill_name=$(basename "$skill_dir")
           cp -r "$skill_dir" "$CLAUDE_SKILLS_DIR/"
           echo "  ✓ $skill_name"
       fi
   done
   ```

3. Update output messages to reflect Claude Code installation

4. Remove agents/ directory copying (workflows are now skills)

### Phase 4: Update Documentation

#### [MODIFY] README.md

**Major sections to update:**

1. **Title and Description**
   - Change from "AI agent templates for Antigravity and Cursor"
   - To: "Claude Code skills for software development workflows"

2. **Quick Start**
   - Update installation path from `~/.gemini/` and `~/.cursor/` to `~/.claude/skills/`
   - Simplify to single installation target

3. **Skills Section**
   - Update table to include all 27 skills
   - Reorganize by category (SDLC, Setup, Utilities, Reviews)
   - Update descriptions to match new SKILL.md format

4. **Usage Instructions**
   - Change from Antigravity/Gemini workflow invocation
   - To: Claude Code skill invocation (e.g., `/plan`, `/commit`)
   - Explain user-invocable vs auto-activated skills

5. **Remove Legacy Sections**
   - Remove Antigravity-specific features (handoffs, turbo mode)
   - Remove references to Gemini and Cursor
   - Update "Related Projects" section

6. **Add New Sections**
   - "Skill Categories" - explain different types
   - "Claude Code Integration" - how skills work in Claude Code

#### [MODIFY] SKILL.md template documentation
Create a template/guide for the new skill format

### Phase 5: Cleanup and Validation

#### [MODIFY] .gitignore (if needed)
Ensure proper files are tracked

#### [DELETE] agents/ directory (OPTIONAL)
Decision needed: Keep agents/ for reference or remove entirely?
- Option A: Keep agents/ as backup/reference
- Option B: Remove agents/ since all content moved to skills/
- **Recommendation**: Keep initially, remove after validation

## Skill Naming Conventions

**IMPORTANT**: Preserve exact agent filenames to maintain slash command compatibility:
- Skill directory names MUST match original agent filenames (without .md extension)
- This ensures existing slash commands continue to work: `/plan`, `/commit`, `/code_review`, etc.
- No renaming or case conversions - maintain exact naming as-is
- Mix of naming styles will remain (snake_case and underscore combinations) to preserve compatibility

## Verification Plan

### Automated Verification
```bash
# Verify all skills created
test $(ls -1 skills/ | wc -l) -eq 27

# Verify each skill has SKILL.md
for skill in skills/*/; do
  test -f "$skill/SKILL.md" || echo "Missing SKILL.md in $skill"
done

# Test installation script
./install-workflows.sh
test -d ~/.claude/skills/plan || echo "Installation failed"
```

### Manual Verification

After implementation:
- [ ] Run `./install-workflows.sh` successfully
- [ ] Verify skills appear in Claude Code
- [ ] Test invoking 3-5 sample skills:
  - [ ] `/plan` - SDLC workflow skill
  - [ ] `/commit` - Git workflow skill
  - [ ] `/code_review` - Review skill
  - [ ] `/quality` - Quality verification skill
  - [ ] `/feature` - Orchestrator skill
- [ ] Verify README accurately describes new structure
- [ ] Check all internal links in README work
- [ ] Verify skill descriptions are clear and actionable

## Implementation Order

1. **Create skills directory structure** (Phase 1)
2. **Convert 3-5 sample agents first** to validate conversion approach:
   - Start with: plan, commit, code_review (diverse examples)
3. **Review sample conversions** - ensure format is correct
4. **Convert remaining 22-24 agents** (Phase 2)
5. **Update install-workflows.sh** (Phase 3)
6. **Update README.md** (Phase 4)
7. **Test installation and validation** (Phase 5)
8. **Cleanup** - decide on agents/ directory fate

## Open Design Decisions

> [!IMPORTANT]
> **Decision 1: Agent Directory Fate**
> - Keep `agents/` directory as backup/reference?
> - Delete `agents/` after successful conversion?
> - **Recommendation**: Keep initially, can remove in future commit after validation
>
> **Decision 2: Skill Categorization**
> - Should some skills be marked as auto-activated vs user-invocable?
> - How to indicate this in SKILL.md frontmatter?
> - **Recommendation**: All remain user-invocable for now; auto-activation can be added later per-skill
>
> **Decision 3: Script Files**
> - Some skills had scripts/ directories (accessibility, security-review)
> - Should we recreate these or are they needed?
> - **Recommendation**: Omit for initial conversion; add back if specific skills need them

## Migration Strategy

This is a breaking change for users who have installed the old workflows. Consider:
- Adding migration notes to README
- Keeping a CHANGELOG entry
- Providing both old and new installation for one version (deprecated)

## Rollback Plan

If conversion fails or skills don't work:
1. Git checkout can restore previous state
2. Keep agents/ directory until fully validated
3. Installation script can be easily reverted
4. README changes are in version control

## Success Criteria

- [ ] All 27 skills successfully converted to SKILL.md format
- [ ] Installation script successfully installs to ~/.claude/skills/
- [ ] README accurately documents new structure
- [ ] Manual testing shows skills work in Claude Code
- [ ] No broken links or references in documentation
- [ ] Clean git history with clear commit messages
