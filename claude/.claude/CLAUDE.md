# CLAUDE.md - Global Development Standards

This file provides global guidance to Claude Code (claude.ai/code) for all development work.

## Development Standards and Conventions

### Prose line wrapping

One continuous line per paragraph — in chat, markdown, PR bodies, Telegram, issue comments. The renderer wraps to viewer width. Hard wraps inside a paragraph break narrow viewports and Markdown list rendering. Never wrap "for readability"; defer to renderer or linter.

Exceptions: code blocks, YAML, config files, shell heredocs with semantic whitespace, git commit messages (both summary ~72c and body ~72c — `git log` and many tools rely on this), languages with enforced formatters (gofmt/rustfmt).

Paragraph separation: blank line. Logical block separation (steps, sections): blank line. Inside a paragraph: no breaks. Code-line length is set by the project's linter — never shorten code lines "for readability" unless the linter asks.

### Communication and Work Approach
- **Communication language**: ALL chat communication MUST be in Russian. Code, commits, PR descriptions, and documentation remain in English
- **Communication style**: Direct and critical. Challenge and correct errors or suboptimal solutions
- **Work approach**: Thoughtful analysis before implementation. Discuss clarifying questions before rushing to code

#### Combined practical guidelines
- **Be explicit, not implicit**: State assumptions, don't hint
- **One thing at a time**: Don't overload with multiple complex topics
- **Confirm understanding**: Check that communication landed correctly
- **Flexibility in interaction**: User may need breaks, changes in pace, or different formats
- **No judgment on reactions**: Intense responses may be trauma or sensory — acknowledge and move on

### Command Usage
- **GitHub interactions**: Use `gh` command for GitHub operations (PRs, issues, releases, etc.)
- Examples:
  - `apt-get upgrade --assume-yes --option Dpkg::Options::="--force-confdef"`
  - `git commit --signoff --message "description"`
  - `helm install --values values.yaml`
  - `kubectl apply --filename manifest.yaml --namespace default`
  - `gh pr create --title "feat: add feature" --draft`

### Delegation-First (Context Hygiene)

Keep the main window clean: retain durable knowledge myself (architecture, current state, decisions, constraints); offload noisy, token-heavy work to agents that run in their own context and return only conclusions.

**Delegate** when: output is noisy and I need only the conclusion (repo-wide search, many files, long test/build runs, broad investigation); work is independent/parallelizable; done-criterion is fully specifiable in the prompt.

**Do it myself** when: the target file/symbol is known; it needs tight iteration or the full chat context (agents can't see history); it's architectural or precision-critical work where a lossy summary is costly — then make the agent return evidence (file:line, exact output), not just a verdict.

Delegation saves the *main window*, not total tokens (each agent reloads its own prompt) — so don't delegate trivial work. Default long-running delegated work to background and stay responsive: don't block idly — take the user's next task or fan out more agents, and fold results in when notified. Background only avoids blocking (it doesn't make the window cleaner); use foreground when the next step depends on the agent's output and nothing else can proceed.

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

### SSH Access

- User relies on an **ssh-agent** for SSH authentication (keys are supplied by a password manager, not stored on disk)
- If an SSH operation fails due to authentication (e.g. `Permission denied (publickey)`, `git push`/`git fetch`/`ssh`/`scp`/`rsync` over SSH failing): **STOP immediately** and ask the user to unlock their password manager so it can add the key to ssh-agent
- Do NOT retry the same command in a loop, do NOT fall back to HTTPS/other transports, do NOT attempt to generate or copy keys
- After the user confirms the key is loaded (e.g. `ssh-add -l` shows it), retry the original command once

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
  - ALL public content MUST be in English: PR titles, PR descriptions, issue comments, code comments, documentation, commit messages.
  - If you working on a project files where Russian is used by default, use Russian, but keep commits and PRs in English.
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

### CLAUDE.md Self-Update

- **Proactively update CLAUDE.md** when useful context emerges during conversations
- This includes: project-specific conventions discovered, user preferences clarified, recurring patterns, workflow decisions, tool configurations, environment details
- Update the appropriate CLAUDE.md file: global (`~/.claude/CLAUDE.md`) for cross-project rules, project-level (`<project>/CLAUDE.md`) for project-specific context
- Before updating: briefly inform the user what you're adding and why
- Keep additions concise and actionable — no verbose explanations, just clear rules/facts
- Do NOT duplicate information already present in CLAUDE.md

### MCP Servers

- **Proactively suggest MCP installation**: When a task could significantly benefit from an MCP server, suggest installing it
- **Balance is key**: MCP servers add tools to context, so don't suggest them for trivial tasks. But when MCP would genuinely help (repeated queries, complex debugging, ongoing work with a system) — suggest it without hesitation
- Prefer project-level installation (`claude mcp add --scope project`) when MCP is specific to repository (after user approval)
- Use global installation (`claude mcp add --scope user`) only for universally useful MCPs (after user approval)
- Prefer containerized MCP servers (podman/docker) over npx/binary for isolation and reproducibility
- Check installed MCP servers with `claude mcp list`
- Search for new MCP servers via web search if one likely exists for the technology

### Slack

Two Slack MCP servers are configured side-by-side; pick the right one per action:

- **`slack-extra`** (`mcp__slack-extra__*`, from <https://github.com/kvaps/slack-mcp-extra>) — use for **all writes from the user's identity**:
  - Posting messages → `slack_post_message`
  - Replying in threads → same tool with `thread_ts`
  - Adding/removing reactions → `slack_add_reaction` / `slack_remove_reaction`
  - Reason: this server uses the user's `xoxp-` token, so messages and reactions appear as the user with no "Sent using @Claude" attribution
- **Official `plugin:slack:slack`** (`mcp__plugin_slack_slack__*`, hosted at `mcp.slack.com`) — use for **everything else**: search, read channel/thread, list channels/users, canvases, drafts. **Do not use** its `slack_send_message` / `slack_send_message_draft` — they always tag the message with "Sent using @Claude"
- If a tool exists in both servers, the `slack-extra` one wins for writes; the official one wins for reads

#### Ænix PR-review channel (`C0B0QE2E65S`)

This is the team-wide PR firehose. Channel rules ([source](https://aenix.slack.com/archives/C0B0QE2E65S/p1777467781432079)):

- **One PR = one message.** Never bundle multiple PR links into a single post — split them into separate consecutive messages so per-PR discussion lives in its own thread and it's visible who is already looking at what.
- Add a couple of words next to each link describing what the PR is about.
- **Strip the URL preview** before sending (`slack_post_message` does this by default — Slack only generates previews for messages from real Slack clients, so MCP-posted messages are already preview-free; just don't add explicit unfurl blocks).
- **Status reactions** (use `slack-extra` reactions tools):
  - `:loading:` — picked it up, currently reviewing
  - `:white_check_mark:` — LGTM
  - `:x:` — not LGTM, changes requested
  - `:merged:` — merged, can scroll past

**Before starting a review** ([source](https://aenix.slack.com/archives/C0B0QE2E65S/p1778091657890989)):

- Check the PR's GitHub state first: `gh pr view <num-or-url> --json reviewDecision,state,mergeStateStatus`. If `reviewDecision == APPROVED` or `state == MERGED` → **skip**, don't burn tokens re-reviewing.
- Slack reactions in this channel can be stale; GitHub state is the source of truth. Don't trust reactions alone.
- Only after the GitHub check passes: drop a `:loading:` reaction so others see you've taken it, then run the review, then replace `:loading:` with `:white_check_mark:` / `:x:` based on outcome.
