# [Project Name] - Claude Code Guidelines

> **Note:** This is a project-specific configuration that extends the global CLAUDE.md at `~/.claude/CLAUDE.md`

## Project Overview

**Purpose:** [Brief description of what this project does]

**Tech Stack:**
- Language: [e.g., Python 3.11, TypeScript 5.x, Go 1.21]
- Framework: [e.g., FastAPI, React, Django]
- Database: [e.g., PostgreSQL, MongoDB, Redis]
- Infrastructure: [e.g., AWS, Docker, Kubernetes]

**Architecture:** [e.g., Microservices, Monolith, Serverless, Event-driven]

## Project Structure

```
[project-root]/
├── [main-directory]/     # [Description]
├── [tests]/              # [Description]
├── [docs]/               # [Description]
└── [config]/             # [Description]
```

## Key Files and Their Roles

- `[important-file.py]` - [What it does and when to modify]
- `[config-file.yaml]` - [Configuration details]
- `[entry-point.ts]` - [Application entry point]

## Project-Specific Guidelines

### Code Style

**What This Project Does Differently:**
- [e.g., "We use dependency injection extensively via the `@inject` decorator"]
- [e.g., "All API endpoints must have OpenAPI documentation"]
- [e.g., "Error handling follows the Result pattern, not exceptions"]

**Common Patterns:**
```[language]
# Example of preferred pattern in this project
[code example]
```

### File Organization

**Where to Put New Code:**
- New features: `[directory]/`
- Tests: `[tests-directory]/` (mirror source structure)
- Configuration: `[config-directory]/`
- Documentation: `[docs-directory]/`

**Naming Conventions:**
- Files: [e.g., snake_case, kebab-case, PascalCase]
- Classes: [e.g., PascalCase]
- Functions: [e.g., camelCase, snake_case]
- Constants: [e.g., SCREAMING_SNAKE_CASE]

### Testing Requirements

**Test Coverage:**
- Minimum coverage: [e.g., 80%]
- Critical paths: [e.g., 100%]
- Test framework: [e.g., pytest, Jest, Go testing]

**Running Tests:**
```bash
[command to run tests]
```

**Test Patterns:**
- Unit tests go in: `[path]`
- Integration tests go in: `[path]`
- E2E tests go in: `[path]`

### Dependencies

**Adding New Dependencies:**
1. [e.g., "Add to pyproject.toml and run `uv sync`"]
2. [e.g., "Update DEPENDENCIES.md with justification"]
3. [e.g., "Ensure license compatibility"]

**Preferred Libraries:**
- HTTP client: [e.g., httpx, axios]
- Date/time: [e.g., pendulum, date-fns]
- Validation: [e.g., pydantic, zod]
- Testing: [e.g., pytest, vitest]

**Avoid These:**
- ❌ [library] - [reason, e.g., "deprecated, use X instead"]
- ❌ [pattern] - [reason, e.g., "causes memory leaks in our stack"]

## Common Mistakes in This Project

### What Claude Often Gets Wrong

1. **[Mistake Category]**
   - ❌ Wrong: [What Claude tends to do]
   - ✅ Right: [What it should do instead]
   - Why: [Explanation]

2. **[Another Mistake]**
   - ❌ Wrong: [Common error]
   - ✅ Right: [Correct approach]
   - Why: [Explanation]

### Edge Cases and Gotchas

- [e.g., "The database connection pool is shared, don't close it in request handlers"]
- [e.g., "The auth middleware expects JWT in Authorization header, not Cookie"]
- [e.g., "Background tasks must be idempotent due to retry logic"]

## Development Workflow

### Local Development

**Setup:**
```bash
[commands to set up local environment]
```

**Running Locally:**
```bash
[commands to run the application]
```

**Environment Variables:**
See `.env.example` for required variables. Never commit actual `.env` files.

### Git Workflow

**Branching:**
- Feature branches: `feature/[description]`
- Bug fixes: `fix/[description]`
- Releases: `release/[version]`

**Commit Messages:**
- Format: `[type]: [description]`
- Types: feat, fix, docs, refactor, test, chore

**Before Committing:**
1. [e.g., "Run linter: `ruff check .`"]
2. [e.g., "Run tests: `pytest`"]
3. [e.g., "Update CHANGELOG.md if needed"]

### CI/CD

**Pipeline Stages:**
1. [e.g., "Lint and format check"]
2. [e.g., "Unit tests"]
3. [e.g., "Integration tests"]
4. [e.g., "Build and deploy"]

**Deployment:**
- Staging: [process]
- Production: [process]

## Integration Points

### External APIs

- **[API Name]**: [Purpose, authentication method, rate limits]
- **[Another API]**: [Details]

### Internal Services

- **[Service Name]**: [What it does, how to communicate]
- **[Another Service]**: [Details]

### Database Schema

**Key Tables/Collections:**
- `[table-name]`: [Purpose, key columns, relationships]
- `[another-table]`: [Details]

**Migration Strategy:**
[e.g., "Alembic migrations in migrations/", "Flyway scripts in db/migrations/"]

## Security Considerations

### Authentication/Authorization

- Method: [e.g., JWT, OAuth2, API keys]
- Token storage: [where and how]
- Permission model: [RBAC, ABAC, etc.]

### Sensitive Data

**Never Include in Logs:**
- [e.g., passwords, tokens, credit card numbers]
- [e.g., personally identifiable information]

**Encryption:**
- At rest: [method]
- In transit: [method]

## Performance Guidelines

### Critical Paths

- [e.g., "The /search endpoint must respond in < 200ms"]
- [e.g., "Background jobs must complete in < 5 minutes"]

### Optimization Priorities

1. [e.g., "Database query optimization"]
2. [e.g., "Caching strategy"]
3. [e.g., "Bundle size reduction"]

### Known Bottlenecks

- [e.g., "The recommendation algorithm is CPU-intensive, consider moving to async"]
- [e.g., "Large file uploads block the main thread, use streaming"]

## Monitoring and Observability

**Logging:**
- Level: [e.g., INFO in prod, DEBUG in dev]
- Format: [e.g., structured JSON]
- Location: [e.g., CloudWatch, Datadog]

**Metrics:**
- [e.g., "Request rate, error rate, latency (RED metrics)"]
- [e.g., "Custom business metrics in [tool]"]

**Tracing:**
- [e.g., "OpenTelemetry with Jaeger"]

## Useful Slash Commands for This Project

- `/[project-command]` - [What it does]
- `/git_status` - Check repository state
- `/pr-to-dev` - Create pull request

## Documentation

**Where to Find More Info:**
- API docs: [location or URL]
- Architecture docs: [location or URL]
- Runbooks: [location or URL]
- Team wiki: [location or URL]

**Don't duplicate documentation here** - link to it instead.

## Team Conventions

### Code Review

**What Reviewers Look For:**
- [e.g., "Test coverage for new features"]
- [e.g., "No hardcoded credentials"]
- [e.g., "Consistent error handling"]

### Communication

- Questions: [e.g., #eng-project-name Slack channel]
- Issues: [e.g., GitHub Issues]
- Design discussions: [e.g., RFC process in docs/rfcs/]

## Troubleshooting

### Common Issues

**Problem:** [Common error message or symptom]
**Solution:** [How to fix it]

**Problem:** [Another common issue]
**Solution:** [Fix]

### Debug Mode

```bash
[How to enable debug mode]
```

## Notes for Claude

### When Working on This Project

1. **Always check CONTEXT.md** for current focus areas
2. **Always check TODO.md** for known issues and planned work
3. **Use [specific-agent]** for [specific-task-type]
4. **Consult [team-member] or [documentation]** for [specific-topic]

### This Project's Quirks

- [e.g., "The test suite uses mocks extensively, real API calls are rare"]
- [e.g., "Configuration is split between YAML files and environment variables"]
- [e.g., "The codebase has legacy code in [directory] that's being gradually refactored"]

---

**Last Updated:** [Date]
**Maintained By:** [Team/Person]
**Version:** [Project Version]
