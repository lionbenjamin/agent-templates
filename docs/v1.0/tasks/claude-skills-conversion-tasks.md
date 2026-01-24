# Claude Code Skills Conversion Tasks

Based on [PLAN.md](file:///Users/ben/Code/agent-templates/PLAN.md)

---

## Phase 1: Foundation (Directory Structure)

- [ ] Create `skills/` base directory
- [ ] Create all 27 skill subdirectories matching agent filenames exactly:
  - [ ] `skills/feature/`
  - [ ] `skills/specify/`
  - [ ] `skills/clarify/`
  - [ ] `skills/plan/`
  - [ ] `skills/review_plan/`
  - [ ] `skills/tasks/`
  - [ ] `skills/implement/`
  - [ ] `skills/code_review/`
  - [ ] `skills/quality/`
  - [ ] `skills/commit/`
  - [ ] `skills/deploy/`
  - [ ] `skills/retro/`
  - [ ] `skills/constitute/`
  - [ ] `skills/review_constitution/`
  - [ ] `skills/domain_model/`
  - [ ] `skills/review_domain/`
  - [ ] `skills/analyze/`
  - [ ] `skills/document/`
  - [ ] `skills/fix/`
  - [ ] `skills/janitor/`
  - [ ] `skills/optimize/`
  - [ ] `skills/a11y_check/`
  - [ ] `skills/release_gate/`
  - [ ] `skills/security_agent/`
  - [ ] `skills/skeptical_review/`
  - [ ] `skills/tech_review/`
  - [ ] `skills/ux_redesign/`

---

## Phase 2: Core Logic (Skill Conversion)

### Part A: Sample Conversions (Validate Approach)

- [ ] [P] Convert `agents/plan.md` → `skills/plan/SKILL.md`
  - Extract description from frontmatter
  - Transform "Persona" → Skill guidance
  - Transform "Prerequisites" → "When to Activate"
  - Transform "Process" → Actionable steps
  - Remove `task_boundary`, `notify_user` API calls
- [ ] [P] Convert `agents/commit.md` → `skills/commit/SKILL.md`
- [ ] [P] Convert `agents/code_review.md` → `skills/code_review/SKILL.md`
- [ ] Review sample conversions for format correctness

### Part B: SDLC Workflow Skills (Remaining)

- [ ] [P] Convert `agents/feature.md` → `skills/feature/SKILL.md`
- [ ] [P] Convert `agents/specify.md` → `skills/specify/SKILL.md`
- [ ] [P] Convert `agents/clarify.md` → `skills/clarify/SKILL.md`
- [ ] [P] Convert `agents/review_plan.md` → `skills/review_plan/SKILL.md`
- [ ] [P] Convert `agents/tasks.md` → `skills/tasks/SKILL.md`
- [ ] [P] Convert `agents/implement.md` → `skills/implement/SKILL.md`
- [ ] [P] Convert `agents/quality.md` → `skills/quality/SKILL.md`
- [ ] [P] Convert `agents/deploy.md` → `skills/deploy/SKILL.md`
- [ ] [P] Convert `agents/retro.md` → `skills/retro/SKILL.md`

### Part C: Project Setup Skills

- [ ] [P] Convert `agents/constitute.md` → `skills/constitute/SKILL.md`
- [ ] [P] Convert `agents/review_constitution.md` → `skills/review_constitution/SKILL.md`
- [ ] [P] Convert `agents/domain_model.md` → `skills/domain_model/SKILL.md`
- [ ] [P] Convert `agents/review_domain.md` → `skills/review_domain/SKILL.md`

### Part D: Utility Skills

- [ ] [P] Convert `agents/analyze.md` → `skills/analyze/SKILL.md`
- [ ] [P] Convert `agents/document.md` → `skills/document/SKILL.md`
- [ ] [P] Convert `agents/fix.md` → `skills/fix/SKILL.md`
- [ ] [P] Convert `agents/janitor.md` → `skills/janitor/SKILL.md`
- [ ] [P] Convert `agents/optimize.md` → `skills/optimize/SKILL.md`
- [ ] [P] Convert `agents/a11y_check.md` → `skills/a11y_check/SKILL.md`
- [ ] [P] Convert `agents/release_gate.md` → `skills/release_gate/SKILL.md`

### Part E: Special Review Skills

- [ ] [P] Convert `agents/security_agent.md` → `skills/security_agent/SKILL.md`
- [ ] [P] Convert `agents/skeptical_review.md` → `skills/skeptical_review/SKILL.md`
- [ ] [P] Convert `agents/tech_review.md` → `skills/tech_review/SKILL.md`
- [ ] [P] Convert `agents/ux_redesign.md` → `skills/ux_redesign/SKILL.md`

---

## Phase 3: Integration & Wiring

### Installation Script Update

- [ ] Modify `install-workflows.sh` target directory:
  - Remove `GEMINI_WORKFLOWS_DIR` and `GEMINI_SKILLS_DIR` variables
  - Remove `CURSOR_DIR` variable
  - Add `CLAUDE_SKILLS_DIR="$HOME/.claude/skills"`
- [ ] Update installation logic to copy skills directories:
  - Loop through `skills/*/` directories
  - Copy each to `$CLAUDE_SKILLS_DIR`
  - Update success messages
- [ ] Remove agents/ directory copying logic
- [ ] Update script output messages for Claude Code

---

## Phase 4: Documentation

### README Update

- [ ] Update title from "AI agent templates for Antigravity and Cursor" to Claude Code skills
- [ ] Update Quick Start installation instructions for `~/.claude/skills/`
- [ ] Update skills table with all 27 skills organized by category:
  - SDLC Workflow Skills
  - Project Setup Skills
  - Utility Skills
  - Review Skills
- [ ] Update usage instructions for Claude Code invocation (e.g., `/plan`, `/commit`)
- [ ] Remove Antigravity-specific features (handoffs, turbo mode)
- [ ] Remove references to Gemini and Cursor
- [ ] Add "Skill Categories" section explaining user-invocable vs auto-activated
- [ ] Add "Claude Code Integration" section
- [ ] Update "Related Projects" section
- [ ] Verify all internal links work

---

## Phase 5: Verification & Tests

### Automated Verification

- [ ] Verify all 27 skill directories exist: `test $(ls -1 skills/ | wc -l) -eq 27`
- [ ] Verify each skill has SKILL.md:
  ```bash
  for skill in skills/*/; do
    test -f "$skill/SKILL.md" || echo "Missing SKILL.md in $skill"
  done
  ```
- [ ] Run installation script: `./install-workflows.sh`
- [ ] Verify installation created `~/.claude/skills/plan/`

### Manual Verification

- [ ] Verify skills appear in Claude Code after installation
- [ ] Test invoking `/plan` skill
- [ ] Test invoking `/commit` skill
- [ ] Test invoking `/code_review` skill
- [ ] Test invoking `/quality` skill
- [ ] Test invoking `/feature` skill
- [ ] Check README accuracy and all links work
- [ ] Verify skill descriptions are clear and actionable

### Cleanup Decision

- [ ] [B] Decide: Keep `agents/` directory for reference or delete?
  - Recommendation: Keep initially, remove after full validation

---

## Task Markers Legend

- `[P]` — Can run in parallel with other `[P]` tasks
- `[B]` — Blocking; dependencies must complete first
