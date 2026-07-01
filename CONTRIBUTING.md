# Contributing to Roblox Skills for Claude Code

Thanks for your interest in improving this pack of Roblox game-development skills! Contributions of all sizes are welcome — new skills, sharper guidance, fixes, and examples.

## Ways to contribute

- **Add a new skill** that covers a Roblox discipline not yet represented.
- **Improve an existing skill** with clearer, more actionable, up-to-date guidance.
- **Fix errors** — outdated Roblox APIs, broken links, typos, or inaccurate advice.
- **Report issues** — open a GitHub issue describing the problem or the gap.

## Skill structure

Each skill lives in its own folder named `roblox-<topic>` and contains a single `SKILL.md`:

```
roblox-<topic>/
└── SKILL.md
```

Every `SKILL.md` must start with YAML frontmatter:

```markdown
---
name: roblox-<topic>
description: One or two sentences. Start with what the skill does, then "Use when/for ..." so Claude knows when to trigger it. Pack in the concrete nouns and scenarios a user would mention.
---

# Human-Readable Title

## Goal
...

## <Sections with actionable, checklist-style guidance>
...

## Anti-Patterns
...
```

### Frontmatter rules

- `name` must match the folder name exactly and use lowercase-kebab-case.
- `description` is the trigger. Make it specific and keyword-rich — list the real terms and situations a developer would describe. This is the single most important field for discoverability.

## Style guidelines

- **Be actionable.** Prefer checklists, decision rules, and concrete steps over prose.
- **Mobile-first.** Most Roblox players are on phones — reflect that everywhere it matters.
- **Security-aware.** Treat currency, inventory, purchases, and remotes as server-authoritative by default.
- **Fair monetization.** No pay-to-win advice.
- **Stay portable.** Skills are Markdown instructions, not code. Avoid tool-specific hacks.
- **Include an Anti-Patterns section** so Claude knows what to avoid.
- Keep line width reasonable and use standard GitHub-flavored Markdown.

## Pull request process

1. **Fork** the repository and create a branch: `git checkout -b add-roblox-<topic>`.
2. Add or edit the relevant `SKILL.md`.
3. If you add a new skill, add a row for it in the [README](README.md) skill catalog.
4. Proofread: valid frontmatter, correct `name`, working links.
5. **Commit** with a clear message and **open a pull request** describing the change and why it helps.

## Code of conduct

Be respectful and constructive. We want this to be a welcoming resource for the whole Roblox creator community.

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE) that covers this project.
