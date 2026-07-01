---
name: roblox-debugging-bugfix
description: Debug and fix Roblox bugs through Studio MCP. Use for repro steps, console errors, script search/read/edit flow, broken UI, failed gameplay systems, data issues, remotes, regressions, root-cause reports, and post-fix verification.
---

# Roblox Debugging Bugfix

## Goal

Move from symptom to verified fix without guessing.

## Debug Loop

1. Capture the user-visible symptom and expected behavior.
2. Reproduce in Play mode when possible.
3. Read `get_console_output`.
4. Search with `script_grep` and `script_search`.
5. Read relevant scripts with `script_read`.
6. Inspect relevant instances with `search_game_tree` and `inspect_instance`.
7. Make the smallest safe fix with `multi_edit`.
8. Re-run the repro and check console output again.

## Common Bug Classes

- Client/server state mismatch.
- Remote payload trust issue.
- UI not updating after server state changes.
- Event connections duplicated or never disconnected.
- DataStore load/save race.
- Object path renamed or missing.
- Play mode DataModel mismatch.
- Race between character spawn, UI creation, and server initialization.

## Fix Rules

- Prefer root-cause fixes over defensive silence.
- Do not swallow errors without logging context.
- Add validation near trust boundaries.
- Keep unrelated refactors out of bug fixes.
- Verify no new console errors.

## Output

Return:

- Repro.
- Root cause.
- Files/scripts changed.
- Verification performed.
- Residual risks.

