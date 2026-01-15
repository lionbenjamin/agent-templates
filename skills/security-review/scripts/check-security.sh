#!/bin/bash
# Security check script for Node.js projects
# Runs npm audit and checks for common security issues

set -e

echo "🔒 Running security audit..."
echo ""

# Check for npm audit
if command -v npm &> /dev/null; then
    echo "📦 NPM Audit:"
    npm audit --audit-level=moderate 2>/dev/null || echo "  ⚠️  npm audit found issues or not in npm project"
    echo ""
fi

# Check for hardcoded secrets patterns
echo "🔑 Checking for potential hardcoded secrets..."
PATTERNS=(
    "password\s*=\s*['\"][^'\"]+['\"]"
    "api[_-]?key\s*=\s*['\"][^'\"]+['\"]"
    "secret\s*=\s*['\"][^'\"]+['\"]"
    "Bearer\s+[A-Za-z0-9\-_]+"
)

FOUND=0
for pattern in "${PATTERNS[@]}"; do
    if grep -rniE "$pattern" --include="*.ts" --include="*.js" --include="*.tsx" --include="*.jsx" . 2>/dev/null | grep -v node_modules | grep -v ".git"; then
        FOUND=1
    fi
done

if [ $FOUND -eq 0 ]; then
    echo "  ✅ No obvious hardcoded secrets found"
fi

echo ""
echo "✅ Security check complete"
