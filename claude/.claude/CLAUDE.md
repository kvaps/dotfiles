# CLAUDE.md - Global Development Standards

This file provides global guidance to Claude Code (claude.ai/code) for all development work.

## Development Standards and Conventions

### Communication and Work Approach
- **Communication language**: ALL chat communication MUST be in Russian. Code, commits, PR descriptions, and documentation remain in English
- **Communication style**: Direct and critical. Challenge and correct errors or suboptimal solutions
- **Work approach**: Thoughtful analysis before implementation. Discuss clarifying questions before rushing to code

### Neurodivergence and Communication Preferences

**Diagnoses**: AuDHD (Autism + ADHD) and PTSD

**Communication principles based on these diagnoses:**

#### AuDHD-specific
- **Direct and literal communication**: No sarcasm, metaphors, idioms, or "reading between the lines". Say exactly what you mean
- **Clear structure**: Numbered lists, step-by-step instructions, explicit priorities
- **Written over verbal**: Written communication allows processing time and reference
- **No ambiguity**: If something can be interpreted multiple ways, clarify upfront
- **Respect for routines**: Predictable patterns reduce cognitive load
- **Acknowledge the internal conflict**: Autism craves routine, ADHD seeks novelty — both are valid
- **Processing time**: Allow time before expecting responses; don't rush

#### PTSD-specific (trauma-informed approach)
- **Safety first**: Physical and emotional safety in all interactions
- **Predictability**: Consistent communication patterns, no sudden surprises
- **Transparency**: Clear about what's happening and why
- **No pressure**: Offer choices, respect boundaries, allow breaks
- **Triggers awareness**: Environmental stimuli may cause strong reactions — this is normal
- **Never require repeating traumatic information**: If something was explained once, don't ask again

#### Combined practical guidelines
- **Be explicit, not implicit**: State assumptions, don't hint
- **One thing at a time**: Don't overload with multiple complex topics
- **Confirm understanding**: Check that communication landed correctly
- **Flexibility in interaction**: User may need breaks, changes in pace, or different formats
- **No judgment on reactions**: Intense responses may be trauma or sensory — acknowledge and move on

### Command Usage
- **Full flag names only**: Expand every short flag to its full form. This applies to ALL commands and ALL flags without exception
  - `-y` → `--assume-yes`
  - `-m` → `--message`
  - `-f` → `--file` or `--filename` or `--values` (context-dependent)
  - `-o` → `--option` or `--output` (context-dependent)
  - `-n` → `--namespace`
  - `-r` → `--recursive`
- **GitHub interactions**: Use `gh` command for GitHub operations (PRs, issues, releases, etc.)
- Examples:
  - `apt-get upgrade --assume-yes --option Dpkg::Options::="--force-confdef"`
  - `git commit --signoff --message "description"`
  - `helm install --values values.yaml`
  - `kubectl apply --filename manifest.yaml --namespace default`
  - `gh pr create --title "feat: add feature" --draft`

### Agent System (~/.claude/agents/)

Specialized subagents for different tasks. Main agent (you) orchestrates them directly.

**Key agents:**

- **tech-oracle**: Technical decisions (libraries, frameworks, patterns). Updates `.architecture.yaml`
- **gopher-builder**: Go code implementation
- **snake-charmer**: Python code implementation
- **docker-smith**: Containerfiles (secure, multi-stage, non-root)
- **kube-pilot**: K8s manifests and ArgoCD apps
- **chart-builder**: Helm charts with TDD (helm-unittest)
- **templ-weaver**: Frontend (Go Templ + HTMX)
- **doc-curator**: Code cleanup (removes AI artifacts)
- **code-guardian**: Git operations (ONLY agent with commit rights)

**Usage principles:**

- For technical decisions → call tech-oracle FIRST, wait for `.architecture.yaml` update
- For implementation → call appropriate specialist (gopher-builder, snake-charmer, etc.)
- After any code changes → call code-guardian for validation and commit
- Subagents cannot call other subagents — you coordinate the workflow

### Git Workflow

- **CRITICAL: NEVER commit or push directly to master/main branch**
- **ALL changes MUST go through feature branches and Pull Requests**
- **CRITICAL: Commit after EACH logical block of work**
  - **DO NOT accumulate multiple changes in one commit**
  - After completing each task/fix/feature: `git add` relevant files → `git commit --signoff`
  - Better to have 10 small focused commits than 1 giant commit
  - Example: After fixing dependencies → commit. After adding API types → commit. After adding tests → commit.
  - This makes review easier and allows granular rollback if needed
- **ALWAYS use --signoff**: ALL commits MUST use `git commit --signoff` flag
- Before creating PR: search for templates in `.github/` directory
- Before creating PR: ask for permission
- Before merging: ask for explicit permission
- Push to feature branch: allowed
- Push to master/main: **ABSOLUTELY FORBIDDEN**
- All commits, PR descriptions, and code: in English
- **NEVER mention (@username) the user in PRs** - PRs are already from user's account and they see them automatically; mentions look strange from outside perspective

### Kubernetes Context Safety

**CRITICAL**: ALWAYS verify kubectl context before running any commands.

- **NEVER run kubectl without explicit context** — prevents accidental operations on wrong clusters
- **Use `--context` flag** for every kubectl command: `kubectl --context homelab get pods`
- **Before any kubectl operation**: verify context with `kubectl config current-context`

### Pull Request Creation Standards

When creating Pull Requests, follow these strict guidelines:

1. **ALWAYS create PR in DRAFT mode by default**
   - Use `gh pr create --draft` flag to create draft PR
   - **ALWAYS show PR text to user BEFORE creating** - ask for approval
   - **ALL PR content MUST be in English** (title, description, all text)
   - Exception: User explicitly requests non-draft PR

2. **Search for PR template**
   - Before creating PR: search `.github/` directory for pull request templates
   - Templates may be: `pull_request_template.md`, `PULL_REQUEST_TEMPLATE.md`, or in `.github/PULL_REQUEST_TEMPLATE/`

3. **Verify template requirements**
   - Ensure ALL template requirements are actually fulfilled (tests, linters, documentation, etc.)
   - Do NOT check boxes that are not truly completed
   - If requirements cannot be met, explain why in PR description

4. **Create PR body from template**
   - Use the complete template structure
   - Do NOT remove sections from the template
   - Fill ALL sections completely and accurately
   - Keep all checkboxes and checklists from template

5. **PR Title format**
   - MUST follow semantic commit format: `type(scope): title`
   - Examples:
     - `feat(api): add user authentication endpoint`
     - `fix(ui): correct button alignment on mobile`
     - `ci(workflows): optimize container builds with native ARM64 runners`
   - Scope should be specific and meaningful
   - Title should be concise and descriptive

6. **PR Body content guidelines**
   - Do NOT mention specific commit hashes or commit messages
   - Focus on WHAT changed and WHY, not HOW (commits show HOW)
   - **Avoid excessive technical details** - diff shows implementation, PR explains purpose
   - Describe changes at a high level, not line-by-line code changes
   - Example: Instead of "Modified jq to output -t and tag separately", write "Fix manifest creation"
   - Avoid specific performance numbers unless essential (e.g., "A is 81% better than B" - too specific!)
   - Use general terms: "significantly faster", "improved performance", "reduced build time"
   - Be technical and factual, avoid marketing language
   - Exception: Specific numbers are OK for breaking changes, API changes, or when precision matters

7. **Technical accuracy**
   - Describe changes accurately and completely
   - Include all significant modifications
   - Mention breaking changes explicitly

8. **Issue references**
   - Do NOT reference issues in commits or PRs unless user explicitly requests it
   - Never add "Fixes #123", "Closes #456", or similar issue references automatically

### Commit Message Format

Use **Semantic Commit Messages** with Claude attribution:

**Format:**

```text
type(scope): brief description of changes

Optional longer explanation of what was changed and why.

Co-Authored-By: Claude <noreply@anthropic.com>
```

**IMPORTANT**: Do NOT include "🤖 Generated with [Claude Code]" anywhere. The `Co-Authored-By: Claude <noreply@anthropic.com>` line is sufficient attribution for commits only. In PR descriptions, comments, documentation, and all other content - no Claude attribution is needed at all.

**Types:**

- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding/updating tests
- `chore`: Maintenance tasks
- `ci`: CI/CD pipeline changes
- `perf`: Performance improvements
- `build`: Build system changes

**Level of Detail:**

- **Avoid excessive technical details** - the diff shows WHAT changed, commit/PR should explain WHY
- Focus on high-level changes and their purpose, not implementation specifics
- Bad example: "Modified jq command to output `-t` and tag on separate lines using `\"-t\", .` syntax"
- Good example: "Fix bash array construction in manifest creation"
- Bad example: "Replaced `find . -type f` with glob pattern `*` for cleaner digest file iteration"
- Good example: "Improve digest file handling"
- Excessive technical details increase cognitive load and obscure the actual purpose
- Code review shows implementation details - commit message should explain the change rationale

### Push Policy

- **Push as RARELY as possible** - minimize push operations
- **💰 Each push triggers CI on remote**: CI runs cost money and distract the user with notifications
- Accumulate multiple commits locally before pushing
- Push only when:
  - Explicitly asked by user
  - About to create PR (need remote branch)
  - Work is logically complete and ready for backup
  - End of work session
- **NEVER push automatically after each commit** - this creates noise, wastes bandwidth, and triggers unnecessary CI runs
- Exception: If user says "commit and push" or "push after each commit", then do it

### Testing Requirements

- **Test locally first** before pushing
- Never disable tests or linters for "quick fixes"
- When tests fail: fix the code, not the tests
- Always run linters and type checkers before committing

### Linting Standards

- **CRITICAL: ALL linting errors must be fixed before pushing**
- There are NO "cosmetic" or "minor" linting errors - every error must be resolved
- Never push code that fails linting, regardless of error type or severity
- All linting issues (godot, funlen, gofmt, unused variables, etc.) are mandatory to fix
- Use `golangci-lint run` locally and ensure zero errors before any push
- If linting rules conflict with project needs, modify `.golangci.yaml` configuration, don't ignore errors

### Linter Configuration Guidelines

When linter rules conflict with project needs or readability:
- Propose disabling specific rules rather than breaking content structure
- Provide clear justification for rule disabling (e.g., technical documentation line length)
- Configure linter via config files (.markdownlint.yaml, .golangci.yaml, etc.)
- Avoid arbitrary code changes just to satisfy overly restrictive rules

### Security and Actions

- **Destructive operations are FORBIDDEN**: Do not execute `rm`, `drop`, `delete`, `truncate`, or any data deletion
- Instead, provide the command for the user to execute themselves if necessary
- Example: "For deletion use: `rm -rf ./tmp` (execute yourself if certain)"
- No external publications, issue creation, or external actions without explicit permission
- Never commit secrets, tokens, or credentials
- Always use environment variables for sensitive data

### Public Communication (GitHub, etc.)

- **CRITICAL: ALWAYS ask for user approval before ANY public action**
- **WARNING**: Unauthorized public actions can:
  - **Cost the user money** (API rate limits, unwanted notifications, time waste)
  - **Cause significant discomfort** to other people (spam, inappropriate mentions, unprofessional communication)
  - **Damage reputation** in open source communities
  - **Violate project etiquette** and community standards
- **NEVER ASSUME** that a message is "obviously correct" - ALWAYS show it first
- Before posting PR/issue comments, ask user to review the text
- Before creating PRs, show the description and ask for approval
- Before replying to maintainers/reviewers, get user confirmation on the message
- Before adding reviewers, assignees, or labels, get user confirmation
- User must explicitly approve the text content before any public posting
- This includes: PR comments, issue comments, PR descriptions, commit messages visible publicly, adding reviewers/assignees, @mentions
- Exception: Purely technical actions like `git push` don't need text approval
- **If in doubt - ASK FIRST, act after approval**
- **LANGUAGE REQUIREMENT**:
  - 💰 **FINANCIAL PENALTIES**: User is FINED for public use of Russian language in GitHub (PRs, issues, comments, documentation)
  - ALL public content MUST be in English: PR titles, PR descriptions, issue comments, code comments, documentation, commit messages
  - Russian is ONLY allowed in private communication with user (chat messages to user)
  - Before posting ANYTHING publicly, verify it's in English

### Code Quality Principles

- **DRY** (Don't Repeat Yourself): Avoid code duplication
- **KISS** (Keep It Simple, Stupid): Prefer simple solutions
- **YAGNI** (You Aren't Gonna Need It): Don't add unnecessary features
- **SOLID** principles for object-oriented design
- Always handle errors explicitly
- Write self-documenting code (clear names, avoid excessive comments)

### Versioning
- **ALWAYS** follow Semantic Versioning (semver)
- Breaking changes require major version bump
- New features require minor version bump
- Bug fixes require patch version bump

### Documentation
- Update documentation alongside code changes
- Keep README files concise and up-to-date
- Document complex logic inline
- API documentation should include examples

### Important Notes

- When instructions conflict: clarify with user
- Don't offer solutions until asked
- Be ready to provide justified criticism of decisions
- Prefer editing existing files over creating new ones
- Never proactively create documentation files unless requested

### MCP Servers

- **Proactively suggest MCP installation**: When a task could significantly benefit from an MCP server, suggest installing it
- **Balance is key**: MCP servers add tools to context, so don't suggest them for trivial tasks. But when MCP would genuinely help (repeated queries, complex debugging, ongoing work with a system) — suggest it without hesitation
- Prefer project-level installation (`claude mcp add --scope project`) when MCP is specific to repository (after user approval)
- Use global installation (`claude mcp add --scope user`) only for universally useful MCPs (after user approval)
- Prefer containerized MCP servers (podman/docker) over npx/binary for isolation and reproducibility
- Check installed MCP servers with `claude mcp list`
- Search for new MCP servers via web search if one likely exists for the technology
