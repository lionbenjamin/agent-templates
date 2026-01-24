# Tasks: Convert Workflows to Claude Code Skills

**Source Plan**: [PLAN.md](PLAN.md)

**Task Legend**:
- `[P]` — Parallel: Can run in parallel with other `[P]` tasks
- `[B]` — Blocking: Dependencies must complete first

---

## Phase 1: Foundation - Directory Structure Creation

### Task 1.1 [B] Create skills base directory
**File**: `skills/` (new directory)

**Actions**:
```bash
mkdir -p skills
```

**Acceptance Criteria**:
- [ ] `skills/` directory exists in project root
- [ ] Directory is tracked by git

**Estimated effort**: 5 minutes

---

### Task 1.2 [B] Create all 27 skill subdirectories
**Files**: All skill directories under `skills/`

**Actions**:
```bash
# SDLC Workflow Agents (12 directories)
mkdir -p skills/feature
mkdir -p skills/specify
mkdir -p skills/clarify
mkdir -p skills/plan
mkdir -p skills/review_plan
mkdir -p skills/tasks
mkdir -p skills/implement
mkdir -p skills/code_review
mkdir -p skills/quality
mkdir -p skills/commit
mkdir -p skills/deploy
mkdir -p skills/retro

# Project Setup Agents (4 directories)
mkdir -p skills/constitute
mkdir -p skills/review_constitution
mkdir -p skills/domain_model
mkdir -p skills/review_domain

# Utility Agents (7 directories)
mkdir -p skills/analyze
mkdir -p skills/document
mkdir -p skills/fix
mkdir -p skills/janitor
mkdir -p skills/optimize
mkdir -p skills/a11y_check
mkdir -p skills/release_gate

# Special Review Agents (4 directories)
mkdir -p skills/security_agent
mkdir -p skills/skeptical_review
mkdir -p skills/tech_review
mkdir -p skills/ux_redesign
```

**Acceptance Criteria**:
- [ ] All 27 skill directories exist under `skills/`
- [ ] Directory names match exact agent filenames (without .md)
- [ ] Verify count: `ls -1 skills/ | wc -l` returns 27

**Estimated effort**: 10 minutes

---

## Phase 2A: Sample Conversion - Validation Batch

**Purpose**: Convert 5 diverse sample skills first to validate conversion approach

### Task 2A.1 [B] Convert plan.md to skills/plan/SKILL.md
**Source**: `agents/plan.md`
**Target**: `skills/plan/SKILL.md`

**Conversion Steps**:
1. Extract `description` from frontmatter → use in SKILL.md frontmatter as `description`
2. Add `name: plan` to frontmatter
3. Transform sections:
   - "Persona: Principal Architect" → "Core Principles" (extract key mindset points)
   - "Prerequisites" → "When to Activate" (convert to context triggers)
   - "Process" steps → "Quick Checks" (convert to verification checklist)
4. Remove workflow-specific items:
   - Remove API calls: `task_boundary`, `notify_user`, `view_file`, `write_to_file`
   - Remove `handoffs` from frontmatter
   - Remove file path conventions (e.g., `docs/<version>/plans/`)
5. Keep relevant guidance as principles

**Acceptance Criteria**:
- [ ] `skills/plan/SKILL.md` created
- [ ] Frontmatter has `name: plan` and `description`
- [ ] No workflow-specific API calls remain
- [ ] Core planning principles preserved
- [ ] File validates against SKILL.md format

**Estimated effort**: 30 minutes

---

### Task 2A.2 [P] Convert commit.md to skills/commit/SKILL.md
**Source**: `agents/commit.md`
**Target**: `skills/commit/SKILL.md`

**Conversion Steps**: (same as Task 2A.1)

**Acceptance Criteria**:
- [ ] `skills/commit/SKILL.md` created
- [ ] Frontmatter has `name: commit` and `description`
- [ ] Core commit principles preserved (conventional commits, clean history)
- [ ] No workflow-specific API calls

**Estimated effort**: 20 minutes

---

### Task 2A.3 [P] Convert code_review.md to skills/code_review/SKILL.md
**Source**: `agents/code_review.md`
**Target**: `skills/code_review/SKILL.md`

**Conversion Steps**: (same as Task 2A.1)

**Acceptance Criteria**:
- [ ] `skills/code_review/SKILL.md` created
- [ ] Frontmatter has `name: code_review` and `description`
- [ ] Code review principles preserved

**Estimated effort**: 25 minutes

---

### Task 2A.4 [P] Convert feature.md to skills/feature/SKILL.md
**Source**: `agents/feature.md`
**Target**: `skills/feature/SKILL.md`

**Conversion Steps**: (same as Task 2A.1)

**Acceptance Criteria**:
- [ ] `skills/feature/SKILL.md` created
- [ ] Frontmatter has `name: feature` and `description`
- [ ] SDLC orchestration principles preserved

**Estimated effort**: 25 minutes

---

### Task 2A.5 [P] Convert quality.md to skills/quality/SKILL.md
**Source**: `agents/quality.md`
**Target**: `skills/quality/SKILL.md`

**Conversion Steps**: (same as Task 2A.1)

**Acceptance Criteria**:
- [ ] `skills/quality/SKILL.md` created
- [ ] Frontmatter has `name: quality` and `description`
- [ ] Quality verification principles preserved

**Estimated effort**: 20 minutes

---

### Task 2A.6 [B] Review sample conversions
**Purpose**: Validate conversion approach before bulk conversion

**Actions**:
1. Review all 5 sample SKILL.md files
2. Verify format consistency
3. Check that principles are preserved
4. Ensure no workflow-specific API calls remain
5. Validate frontmatter format
6. Test that skill names match directory names

**Acceptance Criteria**:
- [ ] All 5 skills follow consistent format
- [ ] Core principles preserved in each
- [ ] Format is clear and actionable
- [ ] Ready to proceed with bulk conversion

**Estimated effort**: 30 minutes

---

## Phase 2B: Bulk Conversion - SDLC Workflow Agents

**Purpose**: Convert remaining SDLC workflow agents (7 agents)

### Task 2B.1 [P] Convert specify.md to skills/specify/SKILL.md
**Source**: `agents/specify.md`
**Target**: `skills/specify/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.2 [P] Convert clarify.md to skills/clarify/SKILL.md
**Source**: `agents/clarify.md`
**Target**: `skills/clarify/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.3 [P] Convert review_plan.md to skills/review_plan/SKILL.md
**Source**: `agents/review_plan.md`
**Target**: `skills/review_plan/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.4 [P] Convert tasks.md to skills/tasks/SKILL.md
**Source**: `agents/tasks.md`
**Target**: `skills/tasks/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.5 [P] Convert implement.md to skills/implement/SKILL.md
**Source**: `agents/implement.md`
**Target**: `skills/implement/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.6 [P] Convert deploy.md to skills/deploy/SKILL.md
**Source**: `agents/deploy.md`
**Target**: `skills/deploy/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2B.7 [P] Convert retro.md to skills/retro/SKILL.md
**Source**: `agents/retro.md`
**Target**: `skills/retro/SKILL.md`
**Estimated effort**: 20 minutes

**Batch Acceptance Criteria**:
- [ ] All 7 SDLC skills converted
- [ ] Each has proper SKILL.md format
- [ ] Verify count: 5 (samples) + 7 (SDLC) = 12 skills completed

---

## Phase 2C: Bulk Conversion - Project Setup Agents

**Purpose**: Convert project setup agents (4 agents)

### Task 2C.1 [P] Convert constitute.md to skills/constitute/SKILL.md
**Source**: `agents/constitute.md`
**Target**: `skills/constitute/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2C.2 [P] Convert review_constitution.md to skills/review_constitution/SKILL.md
**Source**: `agents/review_constitution.md`
**Target**: `skills/review_constitution/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2C.3 [P] Convert domain_model.md to skills/domain_model/SKILL.md
**Source**: `agents/domain_model.md`
**Target**: `skills/domain_model/SKILL.md`
**Estimated effort**: 25 minutes

### Task 2C.4 [P] Convert review_domain.md to skills/review_domain/SKILL.md
**Source**: `agents/review_domain.md`
**Target**: `skills/review_domain/SKILL.md`
**Estimated effort**: 20 minutes

**Batch Acceptance Criteria**:
- [ ] All 4 project setup skills converted
- [ ] Total skills: 12 + 4 = 16 completed

---

## Phase 2D: Bulk Conversion - Utility Agents

**Purpose**: Convert utility agents (7 agents)

### Task 2D.1 [P] Convert analyze.md to skills/analyze/SKILL.md
**Source**: `agents/analyze.md`
**Target**: `skills/analyze/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.2 [P] Convert document.md to skills/document/SKILL.md
**Source**: `agents/document.md`
**Target**: `skills/document/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.3 [P] Convert fix.md to skills/fix/SKILL.md
**Source**: `agents/fix.md`
**Target**: `skills/fix/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.4 [P] Convert janitor.md to skills/janitor/SKILL.md
**Source**: `agents/janitor.md`
**Target**: `skills/janitor/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.5 [P] Convert optimize.md to skills/optimize/SKILL.md
**Source**: `agents/optimize.md`
**Target**: `skills/optimize/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.6 [P] Convert a11y_check.md to skills/a11y_check/SKILL.md
**Source**: `agents/a11y_check.md`
**Target**: `skills/a11y_check/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2D.7 [P] Convert release_gate.md to skills/release_gate/SKILL.md
**Source**: `agents/release_gate.md`
**Target**: `skills/release_gate/SKILL.md`
**Estimated effort**: 20 minutes

**Batch Acceptance Criteria**:
- [ ] All 7 utility skills converted
- [ ] Total skills: 16 + 7 = 23 completed

---

## Phase 2E: Bulk Conversion - Special Review Agents

**Purpose**: Convert special review agents (4 agents)

### Task 2E.1 [P] Convert security_agent.md to skills/security_agent/SKILL.md
**Source**: `agents/security_agent.md`
**Target**: `skills/security_agent/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2E.2 [P] Convert skeptical_review.md to skills/skeptical_review/SKILL.md
**Source**: `agents/skeptical_review.md`
**Target**: `skills/skeptical_review/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2E.3 [P] Convert tech_review.md to skills/tech_review/SKILL.md
**Source**: `agents/tech_review.md`
**Target**: `skills/tech_review/SKILL.md`
**Estimated effort**: 20 minutes

### Task 2E.4 [P] Convert ux_redesign.md to skills/ux_redesign/SKILL.md
**Source**: `agents/ux_redesign.md`
**Target**: `skills/ux_redesign/SKILL.md`
**Estimated effort**: 25 minutes

**Batch Acceptance Criteria**:
- [ ] All 4 special review skills converted
- [ ] Total skills: 23 + 4 = 27 ALL SKILLS COMPLETED ✅
- [ ] Verify: `ls -1 skills/*/*.md | wc -l` returns 27

---

## Phase 3: Installation Script Update

### Task 3.1 [B] Update install-workflows.sh for Claude Code
**File**: `install-workflows.sh`

**Changes Required**:

1. **Update directory variables** (Lines ~10-15):
```bash
# OLD
GEMINI_WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
GEMINI_SKILLS_DIR="$HOME/.gemini/antigravity/skills"
CURSOR_DIR="$HOME/.cursor/commands"

# NEW
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
```

2. **Remove agents/ directory check** (Lines ~17-21):
- Remove check for `AGENTS_DIR`
- Keep check for `SKILLS_DIR`

3. **Update directory creation** (Lines ~23-26):
```bash
# OLD
mkdir -p "$GEMINI_WORKFLOWS_DIR"
mkdir -p "$GEMINI_SKILLS_DIR"
mkdir -p "$CURSOR_DIR"

# NEW
mkdir -p "$CLAUDE_SKILLS_DIR"
```

4. **Remove workflow copying** (Lines ~28-38):
- Remove entire loop that copies `*.md` files from agents/

5. **Update skills installation** (Lines ~40-53):
```bash
# Simplify to single target
echo "🛠️  Installing Claude Code skills..."

for skill_dir in "$SKILLS_DIR"/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        cp -r "$skill_dir" "$CLAUDE_SKILLS_DIR/"
        echo "  ✓ $skill_name"
    fi
done
```

6. **Update success messages** (Lines ~55-59):
```bash
echo ""
echo "✅ Installation complete!"
echo "   Claude Code skills: $CLAUDE_SKILLS_DIR"
echo ""
echo "All 27 skills installed. Invoke with /skill-name (e.g., /plan, /commit)"
```

**Acceptance Criteria**:
- [ ] Script only references Claude Code paths
- [ ] No Gemini or Cursor references remain
- [ ] Script copies from `skills/` directory only
- [ ] Success message accurate
- [ ] Script is executable (`chmod +x install-workflows.sh`)

**Estimated effort**: 30 minutes

---

## Phase 4: Documentation Update

### Task 4.1 [B] Update README.md for Claude Code
**File**: `README.md`

**Major Updates Required**:

#### 1. Title and Description (Lines 1-3)
```markdown
# Claude Code Skills

A comprehensive collection of Claude Code skills for software development workflows. These skills provide specialized AI assistance for various development tasks, from planning to deployment.
```

#### 2. Quick Start (Lines 5-19)
```markdown
## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/lionbenjamin/agent-templates.git
cd agent-templates

# Install skills for Claude Code
./install-workflows.sh
```

This will copy all skills to:
- `~/.claude/skills/` (for Claude Code)

After installation, invoke skills using slash commands: `/plan`, `/commit`, `/deploy`, etc.
```

#### 3. Remove/Update Skills Section (Lines 21-40)
- **REMOVE** the auto-activated skills table (those don't exist yet)
- **ADD** new comprehensive skills table organized by category:

```markdown
## 📚 Available Skills

### SDLC Workflow Skills (User-Invocable)

| Skill | Command | Description |
|-------|---------|-------------|
| feature | `/feature` | Full SDLC orchestrator from specification to deployment |
| specify | `/specify` | Create comprehensive product specifications |
| clarify | `/clarify` | Review and refine requirements & acceptance criteria |
| plan | `/plan` | Create technical implementation plans with TDD strategy |
| review_plan | `/review_plan` | Principal Engineer architectural review of plans |
| tasks | `/tasks` | Break down plans into actionable task lists |
| implement | `/implement` | TDD-first code implementation |
| code_review | `/code_review` | Post-implementation security & quality review |
| quality | `/quality` | Correctness verification and functionality audit |
| commit | `/commit` | Git staging and conventional commits |
| deploy | `/deploy` | Production deployment and release |
| retro | `/retro` | Retrospective analysis and lessons learned |

### Project Setup Skills

| Skill | Command | Description |
|-------|---------|-------------|
| constitute | `/constitute` | Define non-negotiable tech stack and architecture constraints |
| review_constitution | `/review_constitution` | Devil's Advocate stress-test of technical constitution |
| domain_model | `/domain_model` | Create comprehensive domain model with DDD principles |
| review_domain | `/review_domain` | Architectural review of domain model |

### Utility Skills

| Skill | Command | Description |
|-------|---------|-------------|
| analyze | `/analyze` | Validate spec → plan → tasks chain consistency |
| document | `/document` | Documentation synchronization and maintenance |
| fix | `/fix` | Systematic bug fixing with root cause analysis |
| janitor | `/janitor` | Code cleanup and maintenance |
| optimize | `/optimize` | Performance optimization and profiling |
| a11y_check | `/a11y_check` | Accessibility compliance (WCAG 2.1 AA) |
| release_gate | `/release_gate` | Pre-release Go/No-Go validation |

### Special Review Skills

| Skill | Command | Description |
|-------|---------|-------------|
| security_agent | `/security_agent` | Security-focused code analysis |
| skeptical_review | `/skeptical_review` | Critical review with Devil's Advocate thinking |
| tech_review | `/tech_review` | Technical architecture and design review |
| ux_redesign | `/ux_redesign` | UX design review with Nielsen's heuristics |
```

#### 4. Update Project Setup Section (Lines 42-48)
```markdown
## 🏗️ Project Setup Workflow

Establish your project foundation:

1. **Step 0**: `/constitute` - Define tech stack & standards
2. **Step 0.1**: `/review_constitution` - Challenge & validate constraints
3. **Step 0.2**: `/domain_model` - Create comprehensive domain model
4. **Step 0.3**: `/review_domain` - Architectural review of domain model
```

#### 5. Update SDLC Section (Lines 50-64)
- Keep the SDLC workflow as-is
- Update tip to reference `/feature` skill

#### 6. Update Special Agents Section (Lines 66-79)
- Update descriptions to reference skills instead of agents
- Update file references (e.g., `feature.md` → `skills/feature/SKILL.md`)

#### 7. Remove Agent Structure Section (Lines 81-104)
- **REMOVE** this entire section (describes old agent format)

#### 8. Remove Handoffs Section (Lines 106-112)
- **REMOVE** (handoffs don't apply to skills)

#### 9. Remove Task Markers Section (Lines 114-118)
- **REMOVE** (specific to old workflow format)

#### 10. Update Memory System Section (Lines 120-131)
- Keep as-is (still applies)

#### 11. Update Customization Section (Lines 133-148)
```markdown
## 🔧 Customization

### Adding New Skills

1. Create a new directory in `skills/` (e.g., `skills/my_skill/`)
2. Create `SKILL.md` following the standard format:
   ```markdown
   ---
   name: my_skill
   description: Brief description
   ---

   # My Skill

   ## When to Activate
   [Context triggers]

   ## Core Principles
   [Key principles]

   ## Quick Checks
   - [ ] Check 1
   - [ ] Check 2
   ```
3. Run `./install-workflows.sh` to deploy

### Modifying Existing Skills

Edit the corresponding `SKILL.md` file in `skills/<skill-name>/`, then reinstall:

```bash
./install-workflows.sh
```
```

#### 12. Remove Turbo Mode Section (Lines 172-184)
- **REMOVE** (Antigravity-specific feature)

#### 13. Update Related Projects (Lines 190-193)
```markdown
## 🔗 Related Projects

- [Claude Code](https://claude.com/claude-code) - Official Claude CLI
- [Agent Skills Standard](https://github.com/anthropics/agent-skills) - Skills specification
```

#### 14. Update tagline (Line 197)
```markdown
*Built for software teams who value quality, security, and maintainable code.*
```

**Acceptance Criteria**:
- [ ] All Gemini/Antigravity/Cursor references removed
- [ ] All 27 skills documented in tables
- [ ] Skills organized by category
- [ ] Installation instructions accurate
- [ ] No broken internal links
- [ ] All file references point to skills/ directory
- [ ] Customization instructions updated

**Estimated effort**: 1 hour

---

## Phase 5: Validation & Testing

### Task 5.1 [B] Run automated verification tests
**Purpose**: Verify all skills created correctly

**Actions**:
```bash
# Verify all skills created
test $(ls -1 skills/ | wc -l) -eq 27 && echo "✅ All 27 skills created" || echo "❌ Skill count mismatch"

# Verify each skill has SKILL.md
for skill in skills/*/; do
  if [ ! -f "$skill/SKILL.md" ]; then
    echo "❌ Missing SKILL.md in $skill"
  fi
done
echo "✅ All skills have SKILL.md"

# Verify skill names match directory names
for skill in skills/*/; do
  skill_name=$(basename "$skill")
  if ! grep -q "name: $skill_name" "$skill/SKILL.md"; then
    echo "⚠️  Name mismatch in $skill"
  fi
done
echo "✅ All skill names match directories"
```

**Acceptance Criteria**:
- [ ] 27 skills exist
- [ ] All have SKILL.md files
- [ ] All frontmatter names match directory names

**Estimated effort**: 10 minutes

---

### Task 5.2 [B] Test installation script execution
**Purpose**: Verify installation works correctly

**Actions**:
```bash
# Run installation
./install-workflows.sh

# Verify installation
test -d ~/.claude/skills/plan && echo "✅ Installation successful" || echo "❌ Installation failed"

# Count installed skills
installed_count=$(ls -1 ~/.claude/skills/ | wc -l)
if [ "$installed_count" -eq 27 ]; then
  echo "✅ All 27 skills installed"
else
  echo "❌ Only $installed_count skills installed"
fi
```

**Acceptance Criteria**:
- [ ] Script runs without errors
- [ ] All 27 skills copied to `~/.claude/skills/`
- [ ] Success message displays correctly

**Estimated effort**: 10 minutes

---

### Task 5.3 [B] Manual skill invocation tests
**Purpose**: Verify skills work in Claude Code

**Actions**:
Test invoking sample skills:
1. Launch Claude Code
2. Test `/plan` - verify skill loads and provides planning guidance
3. Test `/commit` - verify commit workflow guidance
4. Test `/code_review` - verify review checklist appears
5. Test `/quality` - verify quality verification guidance
6. Test `/feature` - verify orchestration guidance

**Acceptance Criteria**:
- [ ] All 5 test skills invoke successfully
- [ ] Skills provide relevant guidance
- [ ] No error messages appear
- [ ] Skill names work as slash commands

**Estimated effort**: 20 minutes

---

### Task 5.4 [B] Verify documentation accuracy
**Purpose**: Ensure README is accurate and links work

**Actions**:
1. Read through entire README.md
2. Check all skill commands match actual skill names
3. Verify installation paths are correct
4. Test any code examples
5. Check all markdown formatting renders correctly

**Acceptance Criteria**:
- [ ] All skill commands accurate
- [ ] Installation instructions work
- [ ] No broken links
- [ ] Tables render correctly
- [ ] Code blocks formatted properly

**Estimated effort**: 15 minutes

---

## Phase 6: Cleanup & Finalization

### Task 6.1 [B] Update .gitignore (if needed)
**File**: `.gitignore`

**Actions**:
- Ensure `skills/` directory is tracked (not ignored)
- Keep `agents/` directory tracked (for now)

**Acceptance Criteria**:
- [ ] `skills/` directory will be committed
- [ ] No unwanted files tracked

**Estimated effort**: 5 minutes

---

### Task 6.2 [B] Decision: Keep or remove agents/ directory
**Decision Point**: Based on Open Design Decision #1

**Option A: Keep agents/** (Recommended)
- Keep for reference/backup
- Can remove in future cleanup commit

**Option B: Remove agents/**
```bash
git rm -r agents/
```

**Acceptance Criteria**:
- [ ] Decision documented
- [ ] Action taken (keep or remove)

**Estimated effort**: 5 minutes

---

## Summary

**Total Tasks**: 57 tasks across 6 phases
**Estimated Total Effort**: ~10-12 hours

**Phase Breakdown**:
- Phase 1: 2 tasks (~15 min)
- Phase 2A: 6 tasks (~2 hours)
- Phase 2B-E: 22 tasks (~7 hours bulk conversion)
- Phase 3: 1 task (~30 min)
- Phase 4: 1 task (~1 hour)
- Phase 5: 4 tasks (~55 min)
- Phase 6: 2 tasks (~10 min)

**Success Criteria** (from PLAN.md):
- [ ] All 27 skills successfully converted to SKILL.md format
- [ ] Installation script successfully installs to ~/.claude/skills/
- [ ] README accurately documents new structure
- [ ] Manual testing shows skills work in Claude Code
- [ ] No broken links or references in documentation
- [ ] Clean git history with clear commit messages

**Next Steps**:
After task completion, proceed with:
1. Git commit of all changes
2. Update CHANGELOG if exists
3. Consider creating migration guide for existing users
