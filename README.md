# Hunchful MCP server

**Remote MCP server:** `https://hunchful.io/mcp` (Streamable HTTP)

[Hunchful](https://hunchful.io) is an open implementation of the
[Cognitive Model Protocol (CMP)](https://github.com/filinils/cognitive-model-protocol):
a person makes a revisable, **falsifiable** model of how they collaborate best with AI —
hunches with a confidence, an uncertainty, and *what would change my mind* — at a
permanent URL any agent can read. This server lets your assistant read that model,
adapt to it, and help it grow slowly, with the person approving everything that matters.

## Add it

**Claude** — Settings → Connectors → Add custom connector → `https://hunchful.io/mcp`

**ChatGPT** (developer mode) — Settings → Connectors → Add → URL `https://hunchful.io/mcp`,
auth **OAuth** (sign in with your Hunchful account to act on your own model) or none
(open reads; pass keys as tool arguments).

**Anything else** — any MCP client that speaks Streamable HTTP. OAuth 2.1 with PKCE +
dynamic client registration; discovery at `/.well-known/oauth-authorization-server`.

## Tools (rising trust)

| Tool | Auth | What it does |
| --- | --- | --- |
| `read_model` | none | The full model: hunches with confidence, uncertainty, falsifier, pole labels, situational activation rules, and the open-questions to-do list. |
| `find_complementary_thinkers` | none | Which famous thinkers would *complete* this person — opposite poles on the axes where opposites unstick each other. |
| `propose_refinement` | contribution key / OAuth | Strengthen/weaken suggestions → the owner's confirm queue. Nothing applies until they accept. |
| `suggest_question` | contribution key / OAuth | Propose a NEW axis as a question → the owner's inbox (+ opt-in email). |
| `apply_refinement` | edit key / OAuth owner | Direct, logged, reversible confidence nudges with private evidence pointers. |
| `add_hunch` | edit key / OAuth owner | Record a hunch the person just confirmed in conversation — visible, revisable, removable. |
| `find_matches` | edit key / OAuth owner | Look for complementary *people*. Agents propose; humans accept — double opt-in, identities never revealed by the tool. |

## The rules the server enforces

- **Everything is a hypothesis** — revisable positions on two-poled axes, never labels.
- **Nothing is silent** — every write is logged in the model's revision history; evidence
  entries are individually deletable and revert exactly what they applied.
- **Provenance pointers only** — no conversation text, quotes, or third-party names, ever.
- **Never identity** — a protected-attribute screen rejects axes about religion, politics,
  health, ethnicity, gender, sexuality, or neurotype on every write path.
- **Situational hunches** apply only when the person *says* they're in the state.
- **Slow by design** — the model asks agents for at most one suggestion a day, one new
  question a week, and silence when nothing real happened.

## Links

- Agent guide: https://hunchful.io/agent
- Machine-readable model example: `https://hunchful.io/m/{id}/cmp.json`
- Protocol: https://github.com/filinils/cognitive-model-protocol
- Discovery: https://hunchful.io/llms.txt

*The Hunchful app itself is a private codebase; this repo documents its public MCP surface.*
