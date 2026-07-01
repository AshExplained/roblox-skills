# Roblox Skills for Claude Code — 41 AI Skills for Roblox Game Development

> A curated pack of **Claude Code / Claude Agent skills** covering the full **Roblox game development lifecycle** — from game ideas and Luau architecture to monetization, retention, live ops, security, and Roblox Studio MCP workflows. Includes a **vertical-slice workflow** (PRD → issues → triage) that stops the AI from trying to build a whole game in one broken pass.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-41-blue.svg)](#skill-catalog)
[![Made for Roblox](https://img.shields.io/badge/platform-Roblox-red.svg)](https://create.roblox.com/)
[![Luau](https://img.shields.io/badge/language-Luau-000080.svg)](https://luau.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

If you are building **Roblox games with AI** — using **Claude Code**, the **Claude Agent SDK**, or the **Roblox Studio MCP** — this repository gives your agent battle-tested, domain-specific expertise. Each skill is a focused `SKILL.md` playbook that Claude loads on demand to design, build, review, and ship better Roblox experiences.

---

## Table of Contents

- [Why this repo](#why-this-repo)
- [What is a Claude Code skill?](#what-is-a-claude-code-skill)
- [Installation](#installation)
- [Quick start](#quick-start)
- [Skill catalog](#skill-catalog)
- [How the skills fit together](#how-the-skills-fit-together)
- [Use cases](#use-cases)
- [Contributing](#contributing)
- [License](#license)
- [Keywords](#keywords)

---

## Why this repo

Generic AI assistants know a little about everything. Roblox development rewards deep, specific knowledge: **server-authoritative economies**, **mobile-first UX**, **retention loops**, **Luau architecture**, **DataStore persistence**, **exploit-resistant remotes**, and **discovery/CTR optimization**. These skills encode that knowledge so your AI agent behaves like a seasoned Roblox studio team.

**Highlights:**

- 🎮 **End-to-end coverage** — idea → prototype → live ops, one skill per discipline.
- 🧠 **Best-practice playbooks** — retention, monetization, and mobile-first rules baked in.
- 🔒 **Security-first** — anti-dupe, anti-exploit, Creator Store asset auditing, server authority.
- 📱 **Mobile-first** — most Roblox players are on phones; every skill respects that.
- 🛠️ **Roblox Studio MCP aware** — skills know how to inspect, edit, and playtest through Studio MCP.
- 💸 **Fair monetization** — designed to grow revenue without pay-to-win.

## What is a Claude Code skill?

A **skill** is a Markdown file (`SKILL.md`) with YAML frontmatter (`name`, `description`) and a body of instructions. When your task matches a skill's `description`, [Claude Code](https://claude.com/claude-code) automatically loads it and follows its guidance. Skills are model-portable, human-readable, and easy to version-control — no code required.

## Installation

Clone the repository into your Claude Code skills directory.

**Per-project skills** (recommended for a specific game):

```bash
git clone https://github.com/AshExplained/roblox-skills.git .claude/skills/roblox-skills
```

**User-level skills** (available in every project):

```bash
# macOS / Linux
git clone https://github.com/AshExplained/roblox-skills.git ~/.claude/skills/roblox-skills

# Windows (PowerShell)
git clone https://github.com/AshExplained/roblox-skills.git "$env:USERPROFILE\.claude\skills\roblox-skills"
```

Each subfolder contains one `SKILL.md`. Claude Code discovers them automatically — no extra configuration needed.

## Quick start

Once installed, just describe what you want in natural language. Claude picks the right skill:

- *"Give me 3 mobile-first Roblox simulator ideas with fair monetization."* → `roblox-game-ideas`
- *"Design a server-authoritative currency system that resists dupes."* → `roblox-security-economy`
- *"Review this Creator Store model before I insert it."* → `roblox-creator-store-security-audit`
- *"Take this concept from idea to launch."* → `roblox-game-development-lifecycle` (routes to the right specialists)

## Skill catalog

All 34 skills, grouped by phase of the **Roblox game development lifecycle (GDLC)**.

### 🚀 Orchestration & Strategy

| Skill | What it does |
|-------|--------------|
| [`roblox-game-development-lifecycle`](roblox-game-development-lifecycle/SKILL.md) | Umbrella entrypoint that routes broad requests to the right specialist by GDLC phase. |
| [`roblox-game-ideas`](roblox-game-ideas/SKILL.md) | Generate and score game concepts for retention, social, monetization, and mobile fit. |
| [`roblox-genre-patterns`](roblox-genre-patterns/SKILL.md) | Genre-specific design patterns: simulator, tycoon, obby, RPG, tower defense, and more. |

### 🏗️ Architecture & Code

| Skill | What it does |
|-------|--------------|
| [`roblox-luau-architecture`](roblox-luau-architecture/SKILL.md) | ModuleScript/service boundaries, client-server flow, RemoteEvents, ReplicatedStorage. |
| [`roblox-code-maintenance-refactor`](roblox-code-maintenance-refactor/SKILL.md) | Safe refactoring, dead code removal, module boundaries, long-term codebase health. |
| [`roblox-datastore-persistence`](roblox-datastore-persistence/SKILL.md) | Save/load schemas, migrations, autosave, profile locking, data-loss debugging. |
| [`roblox-debugging-bugfix`](roblox-debugging-bugfix/SKILL.md) | Root-cause debugging through Studio MCP with post-fix verification. |
| [`roblox-studio-workflow`](roblox-studio-workflow/SKILL.md) | Safe, productive Roblox Studio MCP usage for inspecting, editing, and playtesting. |

### ⚔️ Gameplay Systems

| Skill | What it does |
|-------|--------------|
| [`roblox-combat-systems`](roblox-combat-systems/SKILL.md) | Melee/ranged/abilities, hit detection, damage validation, exploit-resistant remotes. |
| [`roblox-quest-progression-systems`](roblox-quest-progression-systems/SKILL.md) | Quests, achievements, collections, prestige, daily/weekly goals tied to retention. |
| [`roblox-social-systems`](roblox-social-systems/SKILL.md) | Parties, clans, gifting, trading, co-op, leaderboards, safe player-to-player value. |
| [`roblox-world-level-design`](roblox-world-level-design/SKILL.md) | Worlds, hubs, zones, obbies, arenas, spawns, and text-free player guidance. |

### 🎨 UX, UI & Feel

| Skill | What it does |
|-------|--------------|
| [`roblox-game-ux`](roblox-game-ux/SKILL.md) | HUDs, menus, onboarding, mobile controls, and retention-aware progression surfaces. |
| [`roblox-ui-implementation`](roblox-ui-implementation/SKILL.md) | ScreenGui, mobile-safe layouts, UI state controllers, shop and reward panels. |
| [`roblox-animation-audio-feedback`](roblox-animation-audio-feedback/SKILL.md) | Animation, audio, VFX, reward juice, and satisfying loop feedback without perf cost. |
| [`roblox-localization-accessibility`](roblox-localization-accessibility/SKILL.md) | Text scaling, language-ready copy, contrast, and readable, low-text onboarding. |

### 💰 Economy & Monetization

| Skill | What it does |
|-------|--------------|
| [`roblox-economy-balancing`](roblox-economy-balancing/SKILL.md) | Currency sources/sinks, pricing, reward curves, inflation control, fair pacing. |
| [`roblox-monetization-optimization`](roblox-monetization-optimization/SKILL.md) | Game passes, developer products, bundles, pricing ladders, conversion experiments. |
| [`roblox-retention-monetization`](roblox-retention-monetization/SKILL.md) | Daily rewards, content pacing, events, and anti-pay-to-win strategy. |
| [`roblox-security-economy`](roblox-security-economy/SKILL.md) | Currency, inventory, trading, anti-dupe logic, receipt handling, server authority. |

### 🔒 Security & Compliance

| Skill | What it does |
|-------|--------------|
| [`roblox-creator-store-security-audit`](roblox-creator-store-security-audit/SKILL.md) | Audit Toolbox/Creator Store assets for malicious or risky scripts before trusting them. |
| [`roblox-policy-compliance`](roblox-policy-compliance/SKILL.md) | Community Standards, ad rules, gacha odds disclosure, IP, privacy, pre-publish checks. |
| [`roblox-admin-tools-observability`](roblox-admin-tools-observability/SKILL.md) | Safe admin tools, moderation commands, audit logs, and operational dashboards. |

### 📈 Growth, Publishing & Live Ops

| Skill | What it does |
|-------|--------------|
| [`roblox-publishing-discovery`](roblox-publishing-discovery/SKILL.md) | Icon, thumbnail, name, store copy, and CTR/first-impression optimization. |
| [`roblox-growth-marketing`](roblox-growth-marketing/SKILL.md) | Launch campaigns, sponsored ads, trailers, influencer outreach, acquisition funnels. |
| [`roblox-analytics-instrumentation`](roblox-analytics-instrumentation/SKILL.md) | Retention funnels, event logging, monetization conversion, A/B test planning, KPIs. |
| [`roblox-liveops-roadmap`](roblox-liveops-roadmap/SKILL.md) | Update cadence, events, retention milestones, and release-ready task sequencing. |
| [`roblox-release-operations`](roblox-release-operations/SKILL.md) | Pre-publish checklists, smoke tests, release notes, rollback plans, monitoring. |
| [`roblox-community-ops`](roblox-community-ops/SKILL.md) | Feedback triage, bug reports, sentiment review, community-to-roadmap conversion. |

### ⚡ Performance & QA

| Skill | What it does |
|-------|--------------|
| [`roblox-performance-optimization`](roblox-performance-optimization/SKILL.md) | Mobile frame rate, memory, instance count, physics, particles, streaming, leaks. |
| [`roblox-mobile-playtest`](roblox-mobile-playtest/SKILL.md) | Device simulator checks, touch controls, safe areas, thumb zones, readability. |
| [`roblox-playtest-qa`](roblox-playtest-qa/SKILL.md) | First-session fun, console errors, progression, social hooks, and exploit-sensitive flows. |
| [`roblox-asset-pipeline`](roblox-asset-pipeline/SKILL.md) | Creator Store search, generated meshes/materials, thumbnails, and asset budgets. |

### 🧭 Setup & Vertical-Slice Workflow

| Skill | What it does |
|-------|--------------|
| [`setup-roblox-skills`](setup-roblox-skills/SKILL.md) | Injects a `## Roblox Skills` block into your project's `CLAUDE.md` — the lifecycle map, every skill's purpose/use-case/triggers, and next-step routing. Run once per game project. |
| [`roblox-to-prd`](roblox-to-prd/SKILL.md) | Turns a chosen concept into a short, buildable game design brief (PRD). |
| [`roblox-to-issues`](roblox-to-issues/SKILL.md) | Breaks a PRD into small, independently **playtestable vertical slices** — the fix for "build the whole game at once and everything's broken." |
| [`roblox-triage`](roblox-triage/SKILL.md) | Moves slices and bugs through a state machine so only fully-specified, playtestable work gets built. |

### 🧩 Cross-cutting Utilities

| Skill | What it does |
|-------|--------------|
| [`handoff`](handoff/SKILL.md) | Compacts a long session into a durable handoff doc for the next session/agent. |
| [`zoom-out`](zoom-out/SKILL.md) | Maps an unfamiliar area and its callers before you change it. |
| [`write-a-skill`](write-a-skill/SKILL.md) | Authors a new skill with proper structure and triggers. |
| [`caveman`](caveman/SKILL.md) | Ultra-terse output mode to cut token usage. |

## How the skills fit together

Start broad, then go deep. The **`roblox-game-development-lifecycle`** skill acts as a router: describe a high-level goal ("build a new game", "make this profitable", "plan the roadmap") and it hands off to the right specialists for each phase — ideation, architecture, systems, UX, economy, security, QA, publishing, and live ops.

**Two things keep the AI on track:**

1. **Setup once.** Run [`setup-roblox-skills`](setup-roblox-skills/SKILL.md) in your game project. It writes a routing block into `CLAUDE.md` so every skill knows the lifecycle, its neighbors, and **ends by telling you which skill to run next** — each skill also carries a `## Next` tip for this.
2. **Build in vertical slices.** Instead of generating an entire game in one pass, go **concept → [`roblox-to-prd`](roblox-to-prd/SKILL.md) → [`roblox-to-issues`](roblox-to-issues/SKILL.md) → [`roblox-triage`](roblox-triage/SKILL.md) → build one slice → playtest → repeat.** Each slice cuts through client, server, remotes, data, and UI for one small player-facing capability that you can verify in Studio on its own.

Several core skills also carry battle-tested engineering discipline: [`roblox-debugging-bugfix`](roblox-debugging-bugfix/SKILL.md) builds a reproduction loop and ranks falsifiable hypotheses before touching a fix; [`roblox-game-ux`](roblox-game-ux/SKILL.md) produces an approved UI design brief before [`roblox-ui-implementation`](roblox-ui-implementation/SKILL.md) builds it; and [`roblox-luau-architecture`](roblox-luau-architecture/SKILL.md) applies the deep-module / deletion-test lens.

## Use cases

- **Solo developers** shipping their first Roblox game with an AI pair-programmer.
- **Studios** standardizing best practices across a team of AI agents.
- **Live games** planning updates, events, and monetization experiments.
- **Security reviews** of imported Creator Store assets and economy code.
- **Learning** modern Roblox design patterns, retention, and Luau architecture.

## Contributing

Contributions are welcome! New skills, refinements, and fixes all help. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on skill structure, style, and pull requests.

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details. Use it freely in personal and commercial Roblox projects.

## Keywords

Roblox · Roblox game development · Roblox Studio · Luau · Claude Code · Claude Agent SDK · AI skills · Roblox Studio MCP · Roblox scripting · Roblox monetization · Roblox retention · Roblox game design · DataStore · RemoteEvents · server authority · anti-exploit · anti-dupe · Roblox economy · live ops · mobile-first games · game passes · developer products · Roblox UX · Roblox tycoon · Roblox simulator · Roblox obby · game development lifecycle · AI game development

---

<sub>Built for creators shipping games on Roblox with AI. Not affiliated with or endorsed by Roblox Corporation.</sub>
