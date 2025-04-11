#!/bin/bash

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# Allow 'master' and 'develop' without validation
if [[ "$BRANCH_NAME" == "master" || "$BRANCH_NAME" == "develop" ]]; then
  echo "✔ Skipping validation for protected branch: '$BRANCH_NAME'"
  exit 0
fi

# Validate other branches
PATTERN="^(feature|bugfix|hotfix|release|chore|docs)\/[A-Z]+-\d+\/[a-z0-9-]+$"
if [[ ! "$BRANCH_NAME" =~ $PATTERN ]]; then
  echo "❌ Invalid branch name: '$BRANCH_NAME'"
  echo "✅ Valid formats:"
  echo "   - Protected branches: 'master', 'develop'"
  echo "   - Feature branches: 'type/TICKET-123/task-name' (e.g., 'feature/SCRUM-42/login-page')"
  echo "Allowed prefixes: feature, bugfixe, hotfixe, release, chore, doc"
  exit 1  # Fail the workflow
fi

echo "✔ Branch name '$BRANCH_NAME' is valid."
exit 0
