# Claude Code Configuration

This file serves as the "constitution" for how Claude Code should operate. It defines guardrails, best practices, and common patterns to follow across all projects.

## Core Principles

### 1. Be Deliberate and Think First
- Always use the `mcp__serena__think_about_task_adherence` tool before making significant code changes
- Use `mcp__serena__think_about_collected_information` after research/exploration phases
- Don't rush to solutions - understand the problem space first

### 2. Use Symbolic Tools Over File Reads
- **NEVER** read entire files unless absolutely necessary
- Always start with `mcp__serena__get_symbols_overview` to understand file structure
- Use `mcp__serena__find_symbol` with targeted name paths
- Use `mcp__serena__search_for_pattern` only when symbol names are unknown
- Read full files only as a last resort

### 3. Leverage Specialized Subagents
You have access to 77+ specialized agents. Use them proactively:
- **code-reviewer** - After completing significant code changes
- **security-auditor** - For security-sensitive changes
- **test-automator** - When adding new features requiring tests
- **performance-engineer** - For optimization tasks
- **debugger** - When investigating issues or test failures
- **Explore** - For codebase exploration (use medium/very thorough levels appropriately)

### 4. Context Management
- Keep context compact and relevant
- Don't load documentation into context unnecessarily
- Link to docs instead of embedding them
- Use project-specific CLAUDE.md files for project context
- Load CONTEXT.md and TODO.md at session start

## Common Mistakes to Avoid

### File Operations
❌ **Don't:** Use `cat`, `head`, `tail` for reading files
✅ **Do:** Use the `Read` tool

❌ **Don't:** Use `sed`, `awk` for editing files
✅ **Do:** Use the `Edit` tool or symbolic editing tools

❌ **Don't:** Use `echo >` or `cat <<EOF` for writing files
✅ **Do:** Use the `Write` tool

❌ **Don't:** Use `grep` or `find` commands directly
✅ **Do:** Use `Grep` and `Glob` tools

### Code Changes
❌ **Don't:** Make breaking changes without checking references
✅ **Do:** Use `mcp__serena__find_referencing_symbols` first

❌ **Don't:** Replace entire symbol bodies for minor changes
✅ **Do:** Use regex-based edits for line-level changes

❌ **Don't:** Create new files when existing ones can be modified
✅ **Do:** Always prefer editing existing files

### Git Operations
❌ **Don't:** Create commits unless explicitly asked
✅ **Do:** Wait for user confirmation before committing

❌ **Don't:** Use `--no-verify` or skip hooks
✅ **Do:** Respect pre-commit hooks and fix issues they raise

❌ **Don't:** Use `git push --force` on main/master
✅ **Do:** Ask for confirmation before force pushing

### Context Loading
❌ **Don't:** Read memories unless they're relevant to current task
✅ **Do:** Check memory names first, then read selectively

❌ **Don't:** Use @-mentions for documentation
✅ **Do:** Provide direct links instead

## Tool Usage Patterns

### For Exploration
1. Start with `mcp__serena__list_dir` to understand structure
2. Use `mcp__serena__get_symbols_overview` for code files
3. Use `mcp__serena__find_symbol` with substring_matching if needed
4. Use Task tool with Explore agent for complex searches

### For Editing Code
1. Locate symbol with `mcp__serena__find_symbol` (include_body=false first)
2. Read body only when ready to edit (include_body=true)
3. For full symbol replacement: use `mcp__serena__replace_symbol_body`
4. For line-level changes: use regex-based Edit tool
5. For new code: use `mcp__serena__insert_after_symbol` or `insert_before_symbol`
6. For renaming: use `mcp__serena__rename_symbol` (updates all references)

### For Understanding Dependencies
1. Use `mcp__serena__find_referencing_symbols` to see who uses a symbol
2. Check references before making breaking changes
3. Update all references when changing interfaces

## Hook System

Your hooks are configured for:
- **Safety**: Blocks dangerous operations (rm -rf, .env access)
- **Logging**: Records all tool usage and prompts
- **Context**: Loads project context at session start
- **Notifications**: Alerts on important events

Trust the hooks - they're there to help.

## Slash Commands

You have specialized commands available:
- `/git_status` - Understand repository state
- `/pr-to-dev` - Create pull requests
- `/cook` - Multi-agent parallel processing
- `/crypto_research` - Crypto analysis workflows
- `/sentient` - Complex project management
- `/question` - Non-coding questions

Use them instead of recreating these workflows manually.

## Output Styles

Available styles in ~/.claude/output-styles/:
- `bullet-points.md` - Concise list format
- `ultra-concise.md` - Minimal output
- `markdown-focused.md` - Rich markdown
- `yaml-structured.md` - YAML format
- `tts-summary.md` - Voice-optimized
- `table-based.md` - Tabular data
- `html-structured.md` - HTML output
- `genui.md` - UI generation

Choose the style that best fits the task.

## Project-Specific Configuration

Each project should have its own `.claude/` directory with:
- `CLAUDE.md` - Project-specific guidelines and architecture
- `CONTEXT.md` - Project overview and key information
- `TODO.md` - Current tasks and known issues
- `.claudeignore` - Files to exclude from context
- `settings.local.json` - Project-specific overrides (optional)

## Security Guidelines

### Safe by Default
- Never commit secrets or credentials
- Block access to `.env`, `credentials.json`, and similar files (already in hooks)
- Warn if user tries to commit sensitive files
- Use secure patterns for authentication/authorization

### When in Doubt
- Ask the user for clarification
- Don't make assumptions about security requirements
- Document security decisions in code comments

## Performance Guidelines

### Token Efficiency
- Don't read code you don't need
- Use symbolic tools to minimize context
- Compact conversations when they get long
- Remove irrelevant context before continuing

### Execution Efficiency
- Run independent tools in parallel
- Use Task agent for multi-step exploration
- Batch related operations
- Use appropriate subagent models (haiku for simple tasks)

## Communication Style

- Be concise and professional
- No emojis unless explicitly requested
- Focus on facts and technical accuracy
- Ask clarifying questions when requirements are ambiguous
- Provide context for technical decisions

## Remember

This configuration has been carefully tuned with:
- 77+ specialized subagents for domain expertise
- Comprehensive hooks for safety and automation
- Custom slash commands for common workflows
- Multiple output styles for different contexts

Use these tools proactively. They exist to make your work better.

## Updates and Evolution

This file should evolve based on:
- What Claude gets wrong repeatedly
- New patterns that emerge in your workflow
- Project-specific learnings
- Tool usage insights from hooks

**Don't make this file too large** - it's a constitution, not a manual. Link to detailed docs when needed.
