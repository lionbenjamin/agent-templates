#!/bin/bash
# Accessibility check script using axe-core via puppeteer
# Usage: ./check-a11y.sh <url>

set -e

URL="${1:-http://localhost:3000}"

echo "🔍 Running accessibility audit on: $URL"
echo ""

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ npx is required but not installed."
    exit 1
fi

# Run axe-core via @axe-core/cli
npx --yes @axe-core/cli "$URL" --exit
