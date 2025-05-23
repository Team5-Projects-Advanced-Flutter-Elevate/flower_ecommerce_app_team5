#!/usr/bin/env bash

BRANCH_NAME=${1:-$(git rev-parse --abbrev-ref HEAD)}

# Print the branch name for debugging purposes
echo "Branch name being validated: '$BRANCH_NAME'"

# Allow 'master' and 'develop' without validation
if [[ "$BRANCH_NAME" == "master" || "$BRANCH_NAME" == "develop" ]]; then
  echo "✔ Skipping validation for protected branch: '$BRANCH_NAME'"
  exit 0
fi

# Validate other branches
PATTERN="^(feature|bugfix|hotfix|release)\/[A-Z]+-\d+-[a-zA-Z0-9-]+$"
if [[ ! "$BRANCH_NAME" =~ $PATTERN ]]; then
  echo "❌ Invalid branch name: '$BRANCH_NAME'"
  echo "✅ Valid formats:"
  echo "   - Protected branches: 'master', 'develop'"
  echo "   - Feature branches: 'type/TICKET-123-task-name' (e.g., 'feature/SCRUM-100-login-page')"
  echo "Allowed prefixes: feature, bugfix, hotfix, release"
  exit 1  # Fail the workflow
fi

echo "✔ Branch name '$BRANCH_NAME' is valid."
exit 0
