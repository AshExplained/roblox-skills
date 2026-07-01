---
name: roblox-code-maintenance-refactor
description: Maintain and refactor Roblox Luau code safely. Use for technical debt, dead code removal, module boundaries, naming cleanup, duplicate logic, dependency review, regression prevention, and long-term codebase health.
---

# Roblox Code Maintenance Refactor

## Goal

Improve code health without changing player-facing behavior accidentally.

## Refactor Rules

- Read before editing.
- Keep changes scoped.
- Preserve remote contracts unless intentionally migrating.
- Avoid mixing behavior changes with cleanup.
- Playtest after meaningful refactors.
- Check console output.

## Targets

- Duplicated constants and reward formulas.
- Large scripts with mixed responsibilities.
- Client/server boundary confusion.
- Dead remotes, stale UI paths, unused modules.
- Repeated event connection patterns.
- Unclear names around valuable state.
- Magic numbers that should be balance tables.

## MCP Workflow

1. Use `script_grep` to find duplication, old names, or call sites.
2. Read all affected scripts with `script_read`.
3. Make small edits with `multi_edit`.
4. Use `start_stop_play` to verify the relevant loop.
5. Check `get_console_output`.

## Output

Return:

- Refactor goal.
- Behavior preserved.
- Scripts changed.
- Verification performed.
- Follow-up debt items.

