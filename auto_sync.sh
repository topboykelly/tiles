#!/bin/bash
# === Auto Git Sync Script ===
# Automatically commits and pushes any changes to GitHub every 30 seconds

REPO_PATH="$(pwd)"       # current folder
BRANCH="main"            # change to your branch name if not 'main'
MSG_PREFIX="Auto commit"

echo "í´„ Auto-sync started for repo: $REPO_PATH"
echo "Pushing to branch: $BRANCH"
echo "Checking for changes every 30 seconds..."
echo "---------------------------------------"

while true; do
  cd "$REPO_PATH"
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Changes detected. Syncing..."
    git add .
    git commit -m "$MSG_PREFIX $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin "$BRANCH"
    echo "âœ… Synced to GitHub."
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No changes."
  fi
  sleep 30  # Check every 30 seconds
done

