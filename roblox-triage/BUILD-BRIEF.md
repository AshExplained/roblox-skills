# Writing Build Briefs

A build brief is the authoritative spec posted on a slice when it moves to `ready-to-build`. The original description is context; the build brief is the contract an agent will build from — possibly days later, after the place has changed.

## Principles

### Durable, not path-bound

- **Do** describe behavior, remote contracts, data shape, and which service/module owns the state.
- **Don't** reference exact script paths or line numbers — they go stale in Studio as things get renamed and moved. Name the system ("the coin economy service"), not the instance path.

### Behavioral, not procedural

Describe **what** the game should do, not keystroke-by-keystroke how to build it. The agent explores the place fresh and makes its own implementation calls.

- **Good:** "When the player taps an ore, the server validates cooldown and grants 1 coin; the HUD reflects the new balance from the server, never a local guess."
- **Bad:** "Add a function to ClientHandler and connect it on line 40."

### Server authority is explicit

Every brief that touches valuable state (currency, inventory, purchases, rewards, progression) must state that the server is authoritative and the client only *requests* actions. Call out the trust boundary and any rate-limit.

### Complete, playtestable acceptance criteria

The agent must know when it's done, and the check must be runnable in a Studio playtest.

## Template

```markdown
## Build Brief

**Category:** bug / enhancement
**Summary:** one line.

**Current behavior:** what happens now (for bugs, the broken behavior).

**Desired behavior:** what should happen, including edge cases and failure handling.

**Layers & authority:**
- Client: what the client does (input, prediction, UI only).
- Server (authoritative): what the server validates and grants.
- Remotes: the action names and payload shape; note the trust boundary and rate-limit.
- Data: what persists and when it saves.

**UI design artifact:** (UI slices only) path to the approved artifact.

**Playtest acceptance:**
- [ ] In a Studio playtest, <action> yields <result>.
- [ ] Valuable state is server-validated and survives rejoin.
- [ ] Mobile: readable/tappable on a phone viewport (if UI).
- [ ] No new console errors.

**Out of scope:**
- Adjacent things this slice must NOT change.
```

## Good example (bug)

```markdown
## Build Brief

**Category:** bug
**Summary:** Coin balance shows stale value after rejoin.

**Current behavior:** On rejoin, the HUD shows the coin count from the previous
session for a few seconds before correcting, because the client renders a cached
value before the server profile loads.

**Desired behavior:** The HUD shows no coin value (or a loading state) until the
server profile has loaded, then renders the authoritative value once.

**Layers & authority:**
- Client: HUD waits for the first authoritative balance before rendering a number.
- Server (authoritative): sends the loaded balance once the profile is ready.
- Data: balance comes from the loaded DataStore profile, not a client cache.

**Playtest acceptance:**
- [ ] Rejoin never briefly shows a wrong coin number.
- [ ] The loading state clears within one second of profile load on a normal session.
- [ ] No new console errors.

**Out of scope:**
- Changing the DataStore save schema or the profile-locking logic.
```
