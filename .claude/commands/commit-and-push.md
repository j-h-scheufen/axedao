# Commit and Push with Lint/Build/Test Checks

Automated workflow: lint → build → test → stage → commit (signed) → push

## Flow:

1. **Generate commit message**: I analyze staged changes and recent commits to propose a concise message
2. **You approve**: Review and approve/edit the commit message
3. **Run pnpm lint**: Stops if linting fails
4. **Run pnpm build**: Stops if build fails
5. **Run pnpm test**: Stops if tests fail (unit tests only, excludes integration tests)
6. **Stage all files**: `git add -A` (stages changes across entire monorepo)
7. **Commit with signature**: `git commit -S -m "message"`
8. **Push to remote**: `git push`

## ⚠️ CRITICAL: DO NOT MODIFY APPROVED COMMIT MESSAGE

**Once the user approves a commit message, use it EXACTLY as approved.**

- DO NOT add "🤖 Generated with Claude Code"
- DO NOT add "Co-Authored-By: Claude <noreply@anthropic.com>"
- DO NOT add ANY attribution, footer, or modification of any kind
- Use the EXACT string that was shown and approved
- The approved message is the FINAL message - no additions, no changes

## Prerequisites:

**SSH Agent for commit signing:**

Verify your SSH agent has keys loaded:
```bash
ssh-add -l
```

If this shows your SSH keys, commit signing will work automatically. If not, load keys from macOS keychain:
```bash
ssh-add -A  # or: ssh-add --apple-load-keychain
```

Then verify again with `ssh-add -l`. Commits for this project MUST always be signed.

## Usage:

```
/commit-and-push
```

I will:
1. Check what files are staged (or stage all if none)
2. Generate a commit message based on changes and recent session context that contributed to the staged changes
3. Show you the message for approval
4. Run lint, build, and test checks
5. Commit with signature and push

---

## What I analyze for commit messages:

- Staged file changes (`git diff --staged --stat`)
- Recent commit message style (`git log -5 --oneline`)
- Type of changes (feat/fix/chore/refactor/docs)
- Affected areas (API, UI, auth, database, etc.)

**Message format:** Concise, each line must be 100 chars or less. Small commits favor a a single line, but use longer (multi-line) for larger changes, follows your repo's conventions
