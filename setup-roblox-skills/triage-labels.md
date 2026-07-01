# Triage Labels

`roblox-triage` speaks in canonical roles. This file maps them to the strings actually used in this project's tracker. Edit the right column to match your own vocabulary.

## Category roles

| Canonical      | This project |
| -------------- | ------------ |
| `bug`          | `bug`        |
| `enhancement`  | `enhancement`|

## State roles

| Canonical         | This project      | Meaning                                             |
| ----------------- | ----------------- | --------------------------------------------------- |
| `needs-triage`    | `needs-triage`    | Not yet evaluated                                   |
| `needs-info`      | `needs-info`      | Waiting on the user for a decision or detail        |
| `ready-to-build`  | `ready-to-build`  | Fully specified; an agent can build it in one pass  |
| `needs-human`     | `needs-human`     | Needs the user (Studio action, design/balance call) |
| `wontfix`         | `wontfix`         | Will not be actioned                                |

For the local-markdown tracker, these are the values of the `Status:` line in each slice file. For GitHub, they are issue labels.
