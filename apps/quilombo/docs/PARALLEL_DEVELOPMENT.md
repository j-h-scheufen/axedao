# Parallel Development with Git Worktrees and Claude Code

Guide for running multiple Claude Code sessions in parallel using Git worktrees to work on different features simultaneously.

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Detailed Setup](#detailed-setup)
- [Best Practices](#best-practices)
- [Common Workflows](#common-workflows)
- [Troubleshooting](#troubleshooting)
- [Cleanup](#cleanup)

## Overview

### What are Git Worktrees?

Git worktrees allow you to have **multiple working directories** attached to the same repository. This means you can:
- Work on multiple branches simultaneously without stashing or switching
- Run separate Claude Code sessions for different features
- Test, build, and develop in parallel without conflicts
- Keep different feature contexts isolated

### Benefits for This Monorepo

- **No Context Switching**: Each worktree maintains its own branch state
- **Parallel Testing**: Run tests in one worktree while developing in another
- **Fast PR Reviews**: Check out PR branches in separate worktrees without disrupting your work
- **Efficient Development**: Build different features simultaneously
- **Shared Git Objects**: All worktrees share the same `.git` repository (saves disk space)

## Prerequisites

- Git 2.5+ (worktrees were introduced in Git 2.5)
- pnpm 9.12.3+ (for dependency management)
- Claude Code CLI
- Sufficient disk space for multiple `node_modules` (each worktree needs its own)

Check your Git version:
```bash
git --version
```

## Quick Start

### 1. Create a Worktree for a New Feature

From your main repository directory:

```bash
# Create a worktree for a new feature
git worktree add ../axedao-feature-auth feature/user-authentication

# Navigate to the new worktree
cd ../axedao-feature-auth

# Install dependencies (each worktree needs its own node_modules)
pnpm install

# Copy environment variables from main repo
cp ../axedao/apps/quilombo/.env.local apps/quilombo/.env.local

# Copy Claude settings for consistent command permissions
cp ../axedao/.claude/settings.local.json .claude/settings.local.json

# Start Claude Code in this worktree
claude
```

### 2. Open Another Terminal for a Different Feature

```bash
# Create another worktree for a different feature
git worktree add ../axedao-fix-validation fix/validation-errors

cd ../axedao-fix-validation
pnpm install
cp ../axedao/apps/quilombo/.env.local apps/quilombo/.env.local
cp ../axedao/.claude/settings.local.json .claude/settings.local.json
claude
```

### 3. Continue Working in Your Main Directory

Your main repository at `/Users/jan/development/git/github.com/j-h-scheufen/axedao` remains untouched and can continue working on its current branch.

## Detailed Setup

### Directory Structure Recommendation

```
~/development/git/github.com/j-h-scheufen/
├── axedao/                          # Main repository (e.g., on 'develop' branch)
├── axedao-feature-auth/             # Worktree for feature/user-authentication
├── axedao-feature-filters/          # Worktree for feature/group-search-country-filter
├── axedao-fix-security/             # Worktree for fix/security-vulnerability
└── axedao-review-pr-120/            # Worktree for reviewing PR #120
```

**Why this structure?**
- Keeps worktrees at the same level as main repo (easy to navigate)
- Clear naming convention indicates purpose
- Easy to manage and clean up

### Creating Worktrees

#### For a New Feature (Create New Branch)

```bash
# From main repository
git worktree add -b feature/new-feature ../axedao-feature-name

# Explanation:
# -b creates a new branch
# feature/new-feature is the new branch name
# ../axedao-feature-name is the worktree directory
```

#### For an Existing Branch

```bash
# Checkout existing branch in new worktree
git worktree add ../axedao-existing-branch existing-branch-name
```

#### For PR Review

```bash
# Fetch PR and create worktree
git fetch origin pull/120/head:pr-120
git worktree add ../axedao-review-pr-120 pr-120
```

### Post-Creation Setup

After creating a worktree, **always** run:

```bash
cd ../axedao-new-worktree
pnpm install  # Install dependencies

# Copy environment variables from main repo
cp ../axedao/apps/quilombo/.env.local apps/quilombo/.env.local

# Copy Claude settings (optional, but recommended for consistent command permissions)
cp ../axedao/.claude/settings.local.json .claude/settings.local.json
```

**Important**: Each worktree needs its own `node_modules`, `.env.local`, and `.claude/settings.local.json` because:
- Different branches may have different dependencies
- Builds and caches are isolated
- Environment variables are required for Next.js builds
- Claude settings are developer-specific and control command permissions
- Prevents conflicts between parallel builds

**Note**: `.env.local` and `.claude/settings.local.json` files are gitignored and must be copied manually to each worktree.

## Best Practices

### 1. Naming Convention

Use descriptive names that indicate the purpose:
- `axedao-feature-<feature-name>` - New features
- `axedao-fix-<issue>` - Bug fixes
- `axedao-review-pr-<number>` - PR reviews
- `axedao-refactor-<component>` - Refactoring work

### 2. Branch Strategy

**Recommended approach**:
```bash
# Main repo: Keep on stable branch (develop or main)
cd ~/development/git/github.com/j-h-scheufen/axedao
git checkout develop

# Worktrees: Use for active development/features
git worktree add -b feature/new-auth ../axedao-feature-auth
```

**Why?**
- Main repo stays stable for quick fixes or context switching
- Worktrees handle experimental/feature work
- Easy to nuke a worktree without affecting main repo

### 3. Claude Code Sessions

**One Claude Code session per worktree**:
```bash
# Terminal 1 - Feature A
cd ~/development/git/github.com/j-h-scheufen/axedao-feature-auth
claude

# Terminal 2 - Feature B
cd ~/development/git/github.com/j-h-scheufen/axedao-feature-filters
claude

# Terminal 3 - Main repo (for quick tasks)
cd ~/development/git/github.com/j-h-scheufen/axedao
claude
```

**Best practices**:
- Use clear context: Tell Claude which worktree/feature you're working on
- Keep sessions focused on their respective features
- Don't mix work across worktrees in the same session

### 4. Dependency Management

**pnpm workspaces work across worktrees**, but each worktree needs installation:

```bash
# After creating worktree
cd ../axedao-new-worktree
pnpm install  # Creates node_modules for this worktree

# If you update dependencies in one worktree
pnpm install  # Only affects current worktree

# To update dependencies across all worktrees
for dir in ~/development/git/github.com/j-h-scheufen/axedao*/; do
  (cd "$dir" && pnpm install)
done
```

### 5. Build Artifacts

Each worktree has its own build artifacts:
- `.next/` directories are independent
- No conflicts between parallel builds
- Can run `pnpm dev` in multiple worktrees simultaneously (different ports)

**Running dev servers in parallel**:
```bash
# Terminal 1 - Default port 3000
cd ~/development/git/github.com/j-h-scheufen/axedao-feature-auth
pnpm --filter quilombo dev

# Terminal 2 - Custom port 3001
cd ~/development/git/github.com/j-h-scheufen/axedao-feature-filters
PORT=3001 pnpm --filter quilombo dev
```

### 6. Git Operations

**Commits and pushes work normally**:
```bash
cd ~/development/git/github.com/j-h-scheufen/axedao-feature-auth
git add .
git commit -m "feat: add user authentication"
git push origin feature/user-authentication
```

**Fetching and pulling**:
```bash
# Fetch in any worktree - affects all worktrees (shared .git)
git fetch origin

# Pull in specific worktree
git pull origin feature/user-authentication
```

**Important**: You **cannot** checkout the same branch in multiple worktrees. Git will prevent this:
```bash
# This will fail if main repo is on 'develop'
git worktree add ../axedao-test develop
# Error: 'develop' is already checked out at '/Users/jan/.../axedao'
```

## Common Workflows

### Workflow 1: Feature Development + PR Review

**Scenario**: You're working on a feature but need to review a PR.

```bash
# You're working in main repo on feature/new-auth
cd ~/development/git/github.com/j-h-scheufen/axedao
# Working on feature/new-auth with Claude Code

# PR comes in for review
# Open new terminal
git fetch origin pull/120/head:pr-120-review
git worktree add ../axedao-review-pr-120 pr-120-review
cd ../axedao-review-pr-120
pnpm install
claude
# Review PR with Claude Code
# When done: git worktree remove ../axedao-review-pr-120

# Return to main terminal - still on feature/new-auth, no disruption!
```

### Workflow 2: Parallel Feature Development

**Scenario**: Working on two related features simultaneously.

```bash
# Terminal 1 - Backend API changes
git worktree add -b feature/api-endpoints ../axedao-api
cd ../axedao-api
pnpm install
claude
# Develop API endpoints

# Terminal 2 - Frontend components
git worktree add -b feature/ui-components ../axedao-ui
cd ../axedao-ui
pnpm install
claude
# Develop UI components that consume API

# Terminal 3 - Integration testing
# Keep main repo on develop for testing integration
cd ~/development/git/github.com/j-h-scheufen/axedao
# Merge both branches locally for integration testing
```

### Workflow 3: Hotfix on Production While Developing

**Scenario**: Critical bug in production needs immediate fix while you're mid-feature.

```bash
# You're developing in main repo on feature/large-refactor
cd ~/development/git/github.com/j-h-scheufen/axedao
# Working with Claude Code, lots of uncommitted changes

# Production issue reported!
# Open new terminal
git worktree add -b hotfix/critical-bug ../axedao-hotfix
cd ../axedao-hotfix
pnpm install
claude
# Fix bug, test, commit, push
# Create PR from hotfix/critical-bug

# Return to main terminal - feature work undisturbed!
```

### Workflow 4: Testing Branch Across Different Node Versions

**Scenario**: Need to verify compatibility with different environments.

```bash
# Terminal 1 - Node 20
git worktree add ../axedao-node20 feature/new-api
cd ../axedao-node20
nvm use 20
pnpm install
pnpm test

# Terminal 2 - Node 22
git worktree add ../axedao-node22 feature/new-api
cd ../axedao-node22
nvm use 22
pnpm install
pnpm test

# Compare results across versions
```

## Troubleshooting

### Problem: "fatal: 'branch-name' is already checked out"

**Cause**: You're trying to checkout a branch that's already active in another worktree.

**Solution**:
```bash
# List all worktrees and their branches
git worktree list

# Either work in the existing worktree, or create a new branch
git worktree add -b feature/new-branch ../axedao-new
```

### Problem: "node_modules" Issues or Build Errors

**Cause**: Dependencies not installed or out of sync.

**Solution**:
```bash
cd worktree-directory
rm -rf node_modules
rm pnpm-lock.yaml  # Optional: if dependencies are really broken
pnpm install
```

### Problem: Port Already in Use

**Cause**: Running dev server in multiple worktrees.

**Solution**:
```bash
# Terminal 1
pnpm --filter quilombo dev  # Uses default port 3000

# Terminal 2
PORT=3001 pnpm --filter quilombo dev

# Terminal 3
PORT=3002 pnpm --filter quilombo dev
```

### Problem: Worktree Directory Not Removed Properly

**Cause**: Manually deleting worktree directory without using `git worktree remove`.

**Solution**:
```bash
# List all worktrees (including broken ones)
git worktree list

# Prune stale worktrees
git worktree prune

# If worktree still shows up, force remove
git worktree remove --force path/to/worktree
```

### Problem: Disk Space Running Low

**Cause**: Multiple `node_modules` directories.

**Solution**:
```bash
# Check size of each worktree
du -sh ~/development/git/github.com/j-h-scheufen/axedao*/node_modules

# Remove node_modules in inactive worktrees
cd ~/development/git/github.com/j-h-scheufen/axedao-inactive
rm -rf node_modules

# Reinstall when needed later
pnpm install
```

### Problem: Git Operations Seem Slow

**Cause**: Many worktrees can slow down some Git operations.

**Solution**:
```bash
# List all worktrees
git worktree list

# Remove worktrees you're not actively using
git worktree remove ../axedao-old-feature

# Keep only 2-3 active worktrees at a time
```

## Cleanup

### Removing a Worktree

**Proper way** (recommended):
```bash
# Navigate to main repository
cd ~/development/git/github.com/j-h-scheufen/axedao

# Remove worktree (will fail if there are uncommitted changes)
git worktree remove ../axedao-feature-auth

# Force remove (discards uncommitted changes)
git worktree remove --force ../axedao-feature-auth
```

**What happens**:
- Worktree directory is deleted
- Branch remains in repository (safe to re-checkout later)
- Shared `.git` objects are preserved

### Cleanup After Manual Deletion

If you accidentally deleted a worktree directory manually:

```bash
# Git still thinks worktree exists
git worktree list
# Shows: /path/to/deleted-worktree (branch-name)

# Clean up the reference
git worktree prune

# Verify it's removed
git worktree list
```

### Removing Associated Branch

After removing a worktree, you may want to delete the branch:

```bash
# Remove worktree
git worktree remove ../axedao-feature-auth

# Delete local branch
git branch -d feature/user-authentication

# Delete remote branch (if pushed)
git push origin --delete feature/user-authentication
```

### Bulk Cleanup

Remove all worktrees except main repository:

```bash
# List all worktrees
git worktree list

# Remove each worktree (from main repo)
cd ~/development/git/github.com/j-h-scheufen/axedao
git worktree remove ../axedao-feature-auth
git worktree remove ../axedao-feature-filters
git worktree remove ../axedao-review-pr-120

# Prune any stale references
git worktree prune
```

## Advanced Tips

### 1. Create Worktree with Upstream Tracking

```bash
# Create worktree and set upstream in one command
git worktree add -b feature/new-feature ../axedao-feature-new
cd ../axedao-feature-new
git push -u origin feature/new-feature
```

### 2. Share Build Artifacts (Advanced)

Use symlinks to share certain directories (use with caution):

```bash
# Create worktree
git worktree add -b feature/test ../axedao-test

# Symlink to share .next/cache (if safe for your use case)
cd ../axedao-test/apps/quilombo
rm -rf .next/cache
ln -s ~/development/git/github.com/j-h-scheufen/axedao/apps/quilombo/.next/cache .next/cache
```

**Warning**: Only do this if you understand the implications. Can cause build issues.

### 3. Worktree Aliases

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
# Quick worktree creation
alias wtadd='git worktree add'
alias wtlist='git worktree list'
alias wtremove='git worktree remove'
alias wtprune='git worktree prune'

# Create feature worktree with naming convention
wtfeature() {
  git worktree add -b "feature/$1" "../axedao-feature-$1"
  cd "../axedao-feature-$1"
  pnpm install
}

# Usage: wtfeature user-auth
# Creates: feature/user-auth in ../axedao-feature-user-auth
```

### 4. Automated Worktree Setup Script

Create `~/bin/create-worktree.sh`:

```bash
#!/bin/bash
# Usage: create-worktree.sh <type> <name>
# Example: create-worktree.sh feature user-auth

TYPE=$1
NAME=$2
BRANCH="${TYPE}/${NAME}"
WORKTREE_DIR="../axedao-${TYPE}-${NAME}"

if [ -z "$TYPE" ] || [ -z "$NAME" ]; then
  echo "Usage: create-worktree.sh <type> <name>"
  echo "Types: feature, fix, refactor"
  exit 1
fi

# Create worktree
git worktree add -b "$BRANCH" "$WORKTREE_DIR"

# Navigate and setup
cd "$WORKTREE_DIR"
pnpm install

echo "Worktree created: $WORKTREE_DIR"
echo "Branch: $BRANCH"
echo "Ready for development!"
```

Make it executable:
```bash
chmod +x ~/bin/create-worktree.sh
```

## Summary

### Key Takeaways

1. **One worktree = One branch = One Claude Code session**
2. **Always run `pnpm install` after creating a worktree**
3. **Use descriptive worktree directory names**
4. **Clean up worktrees when done to save disk space**
5. **Don't checkout the same branch in multiple worktrees**

### Recommended Workflow

1. Keep main repository on `develop` for stable work
2. Create worktrees for features, fixes, and PR reviews
3. Run Claude Code in each worktree independently
4. Use clear naming conventions for easy management
5. Clean up worktrees regularly

### Quick Reference

```bash
# Create worktree
git worktree add -b feature/name ../axedao-feature-name
cd ../axedao-feature-name && pnpm install

# List worktrees
git worktree list

# Remove worktree
git worktree remove ../axedao-feature-name

# Cleanup stale references
git worktree prune
```

### Resources

- [Git Worktree Documentation](https://git-scm.com/docs/git-worktree)
- [Pro Git Book - Git Tools](https://git-scm.com/book/en/v2/Git-Tools-Advanced-Merging)

---

**Happy parallel development!** 🚀
