# Tasks

## 1. <!-- Task Group Name -->

- [ ] 1.1 <!-- Write failing test for ... - verify it fails for the right reason -->
- [ ] 1.2 <!-- Implement ... - verify the 1.1 test passes -->

## 2. <!-- Task Group Name -->

- [ ] 2.1 <!-- Task description with its verification -->

## 3. Gates

- [ ] 3.1 Run the full gate set (typecheck, lint, full tests, build) and record verbatim output tails in reviews/gates.md

## 4. Verification

- [ ] 4.1 Code review in a fresh sub-agent: `/code_review` of the diff against design.md, specs/ and technical_constitution.md / RULES.md → reviews/code-review.md; tick only on PASS or PASS WITH COMMENTS
- [ ] 4.2 Security review in a fresh sub-agent: `/security_agent` (OWASP ASVS 5.0 L2) on the diff → reviews/security-review.md; tick only on PASS
<!-- If every Security Surface line in design.md is "no", replace 4.2's text with:
     "4.2 Security waiver: write reviews/security-waiver.md naming the surfaces checked and why none apply; tick once written" -->
- [ ] 4.3 QA in a fresh sub-agent: run `/opsx:verify <change>` if available, then `/quality` for what it and 4.1 did not check (every spec scenario exercised by a test, new consumers, docs references) → reviews/qa.md; tick only on PASS
- [ ] 4.4 `openspec validate <change> --strict` passes

## Workflow follow-up

- After merge: `openspec archive <change>` - it refuses while any task above is unticked.
