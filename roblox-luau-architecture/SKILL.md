---
name: roblox-luau-architecture
description: Design, inspect, and refactor Roblox Luau game architecture. Use for ModuleScript/service boundaries, client-server flow, RemoteEvents/RemoteFunctions, ReplicatedStorage organization, reusable systems, script placement, and safe Studio MCP code-edit workflows.
---

# Roblox Luau Architecture

## Goal

Keep Roblox game code modular, server-authoritative, and easy to extend. Use Roblox Studio MCP to inspect existing scripts before changing architecture.

## MCP Workflow

1. Start with `list_roblox_studios`, `set_active_studio` if needed, and `get_studio_state`.
2. Locate code with `script_search` or `script_grep`.
3. Read relevant scripts with `script_read` before editing.
4. Apply edits with `multi_edit`.
5. Playtest with `start_stop_play`.
6. Check `get_console_output` for regressions.

## Placement Rules

- Put authoritative game logic in `ServerScriptService` or server-owned modules.
- Put shared constants, type definitions, remotes, and pure shared helpers in `ReplicatedStorage`.
- Put player input, camera, local-only UI, and visual prediction in client scripts.
- Keep workspace scripts rare and intentional; prefer service-style scripts that manage tagged instances or configured folders.
- Avoid scattering duplicated constants across client and server.

## Remote Boundaries

- Treat every client remote payload as untrusted.
- Prefer narrow remotes with explicit action names and typed payload checks.
- Rate-limit player-triggered remotes that can affect economy, inventory, combat, or placement.
- Use RemoteFunctions sparingly; avoid long-yielding server calls from the client.
- Never let the client decide currency, inventory, ownership, damage, quest completion, or purchase grants.

## Module Pattern

Use modules for:

- Services with `Init` and `Start` style lifecycle.
- Data access wrappers.
- Economy calculations.
- Reward tables and balancing constants.
- UI controllers on the client.
- Shared utility functions that are deterministic and side-effect-light.

Keep modules small enough that another system can depend on them without importing unrelated behavior.

## Refactor Output

When proposing or making architecture changes, include:

- Current script locations and responsibilities.
- Proposed module/service boundaries.
- Remote contract changes.
- Migration steps.
- Playtest and console checks.

