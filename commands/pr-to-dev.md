---
description: Create a PR from current branch to dev
---

Create a pull request from the current branch to dev branch:

1. Get the current branch name
2. Compare changes between dev and current branch using: `git diff dev...HEAD`
3. Check git status and recent commits on current branch
4. Generate a comprehensive PR description based on:
   - All commits since branching from dev
   - File changes between dev and current branch
   - The purpose and scope of changes
5. Push current branch to remote if needed
6. Create the PR using `gh pr create` with:

   - Base branch: dev
   - Title: A clear, descriptive title based on the changes
   - Body format:

     ```
     ## Summary
     [Bullet points summarizing the key changes]

     ## Changes
     [Detailed list of modifications]

     ## Test Plan
     [Testing steps or checklist]

     🤖 Generated with [Claude Code](https://claude.com/claude-code)
     ```

Important:

- Analyze ALL commits and changes between dev and current branch
- DO NOT use placeholder text - fill in actual change details
- Ensure the summary accurately reflects the actual modifications
- Return the created PR URL
