#!/bin/bash

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# Allow 'master' and 'develop' without validation
if [[ "$BRANCH_NAME" == "master" || "$BRANCH_NAME" == "develop" ]]; then
  echo "✔ Skipping validation for protected branch: '$BRANCH_NAME'"
  exit 0
fi

# Validate other branches
PATTERN="^(features|fixes|hotfixes|chores|docs)/[a-z0-9_]+\([A-Z]+-[0-9]+\)$"
if [[ ! "$BRANCH_NAME" =~ $PATTERN ]]; then
  echo "❌ Invalid branch name: '$BRANCH_NAME'"
  echo "✅ Valid formats:"
  echo "   - Protected branches: 'master', 'develop'"
  echo "   - Feature branches: 'prefix/description(JIRA-123)' (e.g., 'features/login(SCRUM-42)')"
  echo "Allowed prefixes: features, fixes, hotfixes, chores, docs"
  exit 1  # Fail the workflow
fi

echo "✔ Branch name '$BRANCH_NAME' is valid."
exit 0
