#!/bin/bash

# Package daily-top-outcomes workflow into claude-daily-top-outcomes.zip

set -e

WORKFLOW_NAME="daily-top-outcomes"
OUTPUT_ZIP="claude-${WORKFLOW_NAME}.zip"
DIST_DIR="dist"

echo "Packaging ${WORKFLOW_NAME} workflow..."

# Clean dist directory
rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}"

# Create zip from .claude folder and CLAUDE.md
zip -r "${DIST_DIR}/${OUTPUT_ZIP}" .claude/ CLAUDE.md -x "*.DS_Store" -x "__MACOSX/*"

# Verify zip contents
echo ""
echo "Zip contents:"
unzip -l "${DIST_DIR}/${OUTPUT_ZIP}"

# Check required files exist in zip
echo ""
echo "Verifying required files..."
unzip -l "${DIST_DIR}/${OUTPUT_ZIP}" | grep -q ".claude/skills/" && echo "✓ Skills folder found" || echo "✗ Skills folder missing"
unzip -l "${DIST_DIR}/${OUTPUT_ZIP}" | grep -q "SKILL.md" && echo "✓ SKILL.md files found" || echo "✗ SKILL.md files missing"

echo ""
echo "Package created: ${DIST_DIR}/${OUTPUT_ZIP}"
echo ""
echo "To install this workflow:"
echo "  1. Copy ${DIST_DIR}/${OUTPUT_ZIP} to your target project"
echo "  2. Unzip: unzip ${OUTPUT_ZIP}"
echo "  3. Start Claude Code from that directory"