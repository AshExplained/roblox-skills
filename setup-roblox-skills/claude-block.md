<!--
This is the canonical `## Roblox Skills` block that `setup-roblox-skills` injects
into a game project's CLAUDE.md. Inject it verbatim, trimming any skill whose
folder isn't installed. Update in place on re-run; never duplicate.
-->

## Roblox Skills

This project uses the Roblox skill pack. Route requests through these skills instead of improvising.

### Golden rule: build in vertical slices

Do **not** try to build a whole game (or a whole system) in one pass — that is the main cause of half-broken Roblox games. Turn a concept into a PRD (`roblox-to-prd`), slice it into small playtestable pieces (`roblox-to-issues`), and build one slice at a time, verifying each in a Studio playtest before the next. Valuable state (currency, inventory, purchases, rewards, progression) is server-authoritative from the first slice.

### Always suggest the next skill

At the **end of every skill**, tell the user what to run next based on the lifecycle below and the skill's own `## Next` section — e.g. "Done. Next: run `roblox-playtest-qa` to verify, or `roblox-to-issues` to slice the follow-up work." Never leave the user guessing where they are in the lifecycle.

### Lifecycle map

Run roughly in this order; loop back as needed. Don't scale content until the core loop, mobile usability, save/security basics, and retention signals are credible.

1. **Research** — `roblox-game-ideas`, `roblox-genre-patterns`, `roblox-growth-marketing`, `roblox-publishing-discovery`
2. **Concept & core loop** — `roblox-game-ideas`, `roblox-retention-monetization`, `roblox-economy-balancing`, `roblox-game-ux`
3. **Spec & slice** — `roblox-to-prd`, `roblox-to-issues`, `roblox-triage`
4. **Prototype** — `roblox-studio-workflow`, `roblox-luau-architecture`, `roblox-ui-implementation`, `roblox-world-level-design`, `roblox-asset-pipeline`
5. **Vertical slice** — `roblox-game-ux`, `roblox-animation-audio-feedback`, `roblox-datastore-persistence`, `roblox-quest-progression-systems`, `roblox-social-systems`
6. **Production** — `roblox-luau-architecture`, `roblox-combat-systems`, `roblox-quest-progression-systems`, `roblox-social-systems`, `roblox-datastore-persistence`, `roblox-security-economy`, `roblox-asset-pipeline`, `roblox-world-level-design`
7. **QA & security** — `roblox-playtest-qa`, `roblox-mobile-playtest`, `roblox-performance-optimization`, `roblox-debugging-bugfix`, `roblox-security-economy`, `roblox-creator-store-security-audit`, `roblox-policy-compliance`
8. **Soft launch** — `roblox-analytics-instrumentation`, `roblox-playtest-qa`, `roblox-mobile-playtest`, `roblox-release-operations`, `roblox-community-ops`
9. **Polish & balance** — `roblox-economy-balancing`, `roblox-animation-audio-feedback`, `roblox-game-ux`, `roblox-performance-optimization`, `roblox-code-maintenance-refactor`
10. **Publish & launch** — `roblox-publishing-discovery`, `roblox-growth-marketing`, `roblox-policy-compliance`, `roblox-release-operations`
11. **Live ops** — `roblox-liveops-roadmap`, `roblox-analytics-instrumentation`, `roblox-community-ops`, `roblox-quest-progression-systems`, `roblox-monetization-optimization`
12. **Maintenance & growth** — `roblox-debugging-bugfix`, `roblox-code-maintenance-refactor`, `roblox-admin-tools-observability`, `roblox-community-ops`, `roblox-growth-marketing`, `roblox-monetization-optimization`

`roblox-game-development-lifecycle` is the umbrella — use it for broad requests ("build a game", "what next?") to find the current phase and route.

### Skill catalog — purpose · use when · triggers

**Orchestration & planning**

- **roblox-game-development-lifecycle** — umbrella router across the whole lifecycle. *Use when:* broad requests, or you're unsure which phase you're in. *Triggers:* "build a Roblox game", "what should we do next?", "idea to launch", "manage production", "plan the roadmap".
- **roblox-game-ideas** — generate, score, and (grilling mode) stress-test concepts and core loops. *Use when:* pitching concepts, choosing a direction, sharpening a loop. *Triggers:* "game idea", "pitch a concept", "improve the core loop", "grill this idea", "stress-test this plan".
- **roblox-genre-patterns** — genre-specific design patterns (simulator, tycoon, obby, RPG, tower defense…). *Use when:* applying proven patterns to a chosen genre. *Triggers:* "simulator", "tycoon", "obby", "genre patterns", "how do X games work?"

**Spec & slice workflow**

- **roblox-to-prd** — turn a concept/conversation into a short buildable PRD. *Use when:* locking a concept before building. *Triggers:* "write a PRD", "design brief", "turn this into a spec".
- **roblox-to-issues** — break a PRD/plan into small independently-playtestable vertical slices. *Use when:* you're about to build; stops "whole game at once". *Triggers:* "break into issues", "slice this", "make tickets", "what do we build first?"
- **roblox-triage** — move slices/bugs through a state machine so only fully-specified work gets built. *Use when:* deciding what's ready to build, reviewing bugs. *Triggers:* "triage", "is this ready to build?", "what needs attention?"

**Architecture & code**

- **roblox-luau-architecture** — module/service boundaries, client-server flow, remotes, deep modules. *Use when:* designing or refactoring code structure. *Triggers:* "architecture", "module boundaries", "RemoteEvents", "where should this script go?"
- **roblox-code-maintenance-refactor** — safe refactors, dead code, duplication, deepening opportunities. *Use when:* paying down tech debt without changing behavior. *Triggers:* "refactor", "clean up", "tech debt", "consolidate duplicate logic".
- **roblox-datastore-persistence** — save/load schemas, migrations, autosave, profile locking. *Use when:* anything must survive rejoin/shutdown. *Triggers:* "DataStore", "save data", "persistence", "data loss", "profile".
- **roblox-debugging-bugfix** — disciplined diagnosis: build a repro loop, rank hypotheses, fix, regression-test. *Use when:* something is broken/throwing/failing/flaky. *Triggers:* "debug", "diagnose", "broken", "error", "not working", "regression".
- **roblox-studio-workflow** — safe, productive Studio MCP use (inspect, edit, insert, playtest). *Use when:* connecting to or acting through Studio. *Triggers:* "connect to Studio", "playtest", "inspect the place", "edit scripts in Studio".

**Gameplay systems**

- **roblox-combat-systems** — melee/ranged/abilities, hit detection, damage validation, exploit-resistant remotes. *Use when:* building or reviewing combat. *Triggers:* "combat", "weapons", "abilities", "hit detection", "damage".
- **roblox-quest-progression-systems** — quests, achievements, collections, prestige, daily/weekly goals. *Use when:* building short- and long-term goals. *Triggers:* "quests", "achievements", "daily rewards", "progression", "unlocks".
- **roblox-social-systems** — parties, clans, gifting, trading, co-op, leaderboards. *Use when:* building player-to-player features. *Triggers:* "trading", "clans", "parties", "leaderboards", "co-op", "gifting".
- **roblox-world-level-design** — worlds, hubs, zones, obbies, arenas, spawns, text-free guidance. *Use when:* laying out spaces and player flow. *Triggers:* "level design", "world", "map", "hub", "zone layout", "spawn".

**UX, UI & feel**

- **roblox-game-ux** — design/critique UX and onboarding; **produce & approve the UI design artifact** before UI is built. *Use when:* making the experience clear/fast/touch-friendly, or before building any UI. *Triggers:* "UX", "onboarding", "design the UI", "mock this screen", "UI design".
- **roblox-ui-implementation** — build ScreenGui/HUDs/menus in Studio against an approved design. *Use when:* implementing UI. *Triggers:* "build the HUD", "make this menu", "shop panel", "implement UI".
- **roblox-animation-audio-feedback** — animation, audio, VFX, reward juice, satisfying feedback. *Use when:* improving feel without hurting mobile perf. *Triggers:* "game feel", "juice", "VFX", "sound effects", "feedback".
- **roblox-localization-accessibility** — text scaling, language-ready copy, contrast, readable low-text onboarding. *Use when:* broadening reach and readability. *Triggers:* "localization", "accessibility", "translate", "text scaling", "contrast".

**Economy & monetization**

- **roblox-economy-balancing** — currency sources/sinks, pricing, reward curves, inflation control. *Use when:* tuning progression math and economy. *Triggers:* "balance the economy", "pricing", "reward curve", "inflation".
- **roblox-monetization-optimization** — game passes, developer products, bundles, pricing ladders, conversion. *Use when:* growing revenue fairly. *Triggers:* "monetization", "game passes", "developer products", "increase revenue".
- **roblox-retention-monetization** — daily rewards, content pacing, events, anti-pay-to-win strategy. *Use when:* designing retention + fair monetization together. *Triggers:* "retention", "daily rewards", "content pacing", "anti pay-to-win".
- **roblox-security-economy** — currency/inventory/trading/purchases, anti-dupe, server authority, receipts. *Use when:* any valuable state or exploit surface. *Triggers:* "anti-exploit", "anti-dupe", "server authority", "secure the economy", "receipt".

**Security & compliance**

- **roblox-creator-store-security-audit** — audit Toolbox/Creator Store assets for malicious scripts before trusting them. *Use when:* importing or inserting third-party assets. *Triggers:* "is this asset safe?", "audit this model", "Toolbox", "free model".
- **roblox-policy-compliance** — Community Standards, ad rules, gacha odds disclosure, IP, privacy, pre-publish checks. *Use when:* checking platform risk before publishing. *Triggers:* "policy", "compliance", "allowed?", "gacha odds", "age rating".
- **roblox-admin-tools-observability** — safe admin/moderation tools, audit logs, operational dashboards. *Use when:* building admin/ops tooling. *Triggers:* "admin commands", "moderation tools", "audit log", "ops dashboard".

**Growth, publishing & live ops**

- **roblox-publishing-discovery** — icon, thumbnail, name, store copy, CTR/first-impression. *Use when:* preparing the store page. *Triggers:* "thumbnail", "icon", "game name", "store page", "improve CTR".
- **roblox-growth-marketing** — launch campaigns, sponsored ads, trailers, influencers, acquisition funnels. *Use when:* driving traffic. *Triggers:* "marketing", "ads", "trailer", "influencers", "launch campaign".
- **roblox-analytics-instrumentation** — retention funnels, event logging, conversion, A/B planning, KPIs. *Use when:* deciding what to measure or reviewing metrics. *Triggers:* "analytics", "funnel", "track events", "KPIs", "A/B test".
- **roblox-liveops-roadmap** — update cadence, events, retention milestones, release-ready task sequencing. *Use when:* planning ongoing updates for a live game. *Triggers:* "live ops", "roadmap", "update schedule", "event plan".
- **roblox-release-operations** — pre-publish checklists, smoke tests, release notes, rollback, monitoring. *Use when:* shipping a build. *Triggers:* "release", "publish checklist", "rollback plan", "release notes".
- **roblox-community-ops** — feedback triage, bug reports, sentiment, community-to-roadmap. *Use when:* managing players and feedback. *Triggers:* "community", "player feedback", "reviews", "Discord".

**Performance & QA**

- **roblox-performance-optimization** — mobile frame rate, memory, instance count, physics, streaming, leaks. *Use when:* the game is heavy or janky. *Triggers:* "performance", "lag", "frame rate", "optimize", "memory leak".
- **roblox-mobile-playtest** — device-simulator checks, touch, safe areas, thumb zones, readability. *Use when:* verifying the mobile experience. *Triggers:* "mobile playtest", "phone test", "touch controls", "safe area".
- **roblox-playtest-qa** — playtest for first-session fun, errors, progression, social, exploit-sensitive flows. *Use when:* verifying a slice or build works. *Triggers:* "playtest", "QA", "test the game", "does it work?"
- **roblox-asset-pipeline** — Creator Store search, generated meshes/materials, thumbnails, asset budgets. *Use when:* sourcing or generating assets. *Triggers:* "find assets", "generate a mesh", "insert a model", "asset budget".

**Cross-cutting utilities**

- **handoff** — write a durable handoff doc for the next session/agent. *Use when:* context is deep and work is about to switch. *Triggers:* "handoff", "summarize for next session".
- **zoom-out** — map an unfamiliar area before changing it. *Use when:* you don't know how a system fits together. *Triggers:* "zoom out", "big picture", "map this".
- **write-a-skill** — author a new skill for this pack. *Use when:* adding/editing a skill. *Triggers:* "write a skill", "create a skill".
- **caveman** — ultra-terse output mode. *Use when:* the user wants brevity. *Triggers:* "caveman mode", "be brief", "less tokens". Off with "normal mode".

### Project config

- **Tracker:** see `docs/agents/tracker.md`.
- **Triage labels:** see `docs/agents/triage-labels.md`.
- **UI design artifacts:** see `docs/agents/design.md`.
- **Roadmap index:** `ROADMAP.md` — `[ ]` not started · `[~]` built & tested, awaiting approval · `[x]` built, playtested, and approved.
