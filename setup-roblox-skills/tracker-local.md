# Tracker: Local Roadmap (Studio-first)

Work for this game is tracked as markdown in the repo/place folder. Best for solo devs working in Studio without a Git remote. This is the default.

## Layout

- `ROADMAP.md` at the root is the human-readable index of slices, using the pack's checkbox convention:
  - `[ ]` not started
  - `[~]` built and tested in Studio, awaiting human approval
  - `[x]` built, playtested, and explicitly approved (append the approval date)
- One feature per directory: `roadmap/<feature-slug>/`
  - PRD: `roadmap/<feature-slug>/PRD.md`
  - Slices: `roadmap/<feature-slug>/slices/NN-<slug>.md`, numbered from `01`
- Triage state is a `Status:` line near the top of each slice file (see `triage-labels.md` for the role strings).
- Comments/decisions append to the bottom of the slice file under a `## Notes` heading.

## When a skill says "publish to the tracker"

Create the file under `roadmap/<feature-slug>/` (creating the directory if needed) and add a matching checkbox line to `ROADMAP.md`.

## When a skill says "fetch the item"

Read the referenced file (the user usually passes the path or slice number), or the matching line in `ROADMAP.md`.
