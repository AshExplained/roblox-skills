# UI Design Artifacts

Roblox UI is built in Studio (ScreenGui/Luau), not HTML — so a design artifact here is a **markdown design brief** (optionally with reference images/screenshots), not an HTML stylekit. It is the visual contract a UI slice is built against.

## Layout

```
design/
├── DESIGN.md                       ← global UI kit: palette, type scale, spacing,
│                                      button/panel patterns, mobile safe-area rules
└── features/
    └── <feature-slug>/
        ├── design.md               ← this surface's brief (Status: draft | approved)
        └── screenshots/            ← reference mockups or Studio captures
```

## What a feature `design.md` must cover

- User goal and which surface/flow it is (HUD, shop, reward, menu…).
- Layout and responsive behavior across **mobile, tablet, and desktop**, including safe areas and thumb zones.
- Every relevant state: default, empty, loading, error, and permission/locked.
- Interactions and copy rules.
- Dependencies on the global `DESIGN.md`.
- A `Status:` line — `draft` until the user approves, then `approved`.

## Producer / consumer

- **Producer:** `roblox-game-ux` creates and iterates these briefs and drives approval.
- **Consumer:** `roblox-ui-implementation` reads the approved brief before building; `roblox-to-issues` and `roblox-triage` keep UI slices out of `ready-to-build` until the brief says `Status: approved`.

## Missing artifact

If a UI slice has no approved brief, create (or request) a HITL design-approval slice first instead of marking implementation ready.
