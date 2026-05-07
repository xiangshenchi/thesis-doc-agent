# thesis-doc-agent

> A Claude skill that reads your project code and conversation history, then generates structured software engineering documents ready for academic thesis submission.

**[中文文档](./README.md)**

---

## What It Does

`thesis-doc-agent` is a skill for Claude Code and compatible AI coding agents. Given a codebase and/or a conversation history, it automatically:

- Analyzes the project from multiple software engineering perspectives
- Generates thesis-ready documents with proper academic tone
- **Enforces strict code traceability** — every code reference includes an exact file path and line range
- Produces Mermaid diagrams for architecture, ER, and sequence flows

It is designed for computer science / software engineering students who need to produce systematic documentation for their final-year projects or graduation theses.

## Documents Supported

| Document | Thesis Chapter |
|----------|---------------|
| Requirements Analysis | Ch. 2 — Requirements |
| System Architecture Design | Ch. 3 — System Design |
| Database Design | Ch. 3 — System Design |
| API Reference | Ch. 3 / Appendix |
| Module Implementation Detail | Ch. 4 — Implementation |
| Test Plan & Results | Ch. 5 — Testing |
| Conclusion & Future Work | Ch. 6 — Conclusion |

## Installation

### Prerequisites

- [Claude Code](https://claude.ai/code) or any agent environment that supports the `.skill` format
- A project codebase (any language) and/or Claude conversation history

### Install from release

1. Download `thesis-doc-agent.skill` from the [Releases](../../releases) page
2. Place it in your skills directory (e.g. `~/.claude/skills/`)
3. The skill is automatically discovered on the next session

### Install from source

```bash
git clone https://github.com/xiangshenchi/thesis-doc-agent.git
# Copy the skill folder to your skills mount path
cp -r thesis-doc-agent ~/.claude/skills/
```

## Usage

Once installed, just describe what you need in natural language. The skill triggers automatically on phrases like:

```
"Help me generate a requirements analysis document"
"Analyze my project architecture"
"Write the system design chapter for my thesis"
"Generate an ER diagram from my models"
"Create an API reference from my routes"
```

### Example workflow

```
You: I've finished my backend project. Can you analyze the codebase
     and generate the system architecture section for my thesis?

Claude: [reads SKILL.md → scans project files → generates document]

# Output includes:
# - Architecture diagram (Mermaid)
# - Tech stack table with rationale
# - Module breakdown with exact file paths
# - Academic-tone prose ready for copy-paste
```

### Code traceability — what it looks like

Every code reference in the generated documents follows this format:

```
**Source:** `src/api/auth/router.py`, lines 45–78
**Purpose:** JWT login endpoint — validates credentials and issues a signed token

[code snippet]
```

Vague references like *"in the auth module"* are explicitly forbidden by the skill instructions.

## Skill Structure

```
thesis-doc-agent/
├── SKILL.md                      # Core instructions (entry point)
└── references/
    ├── req-analysis.md           # Requirements document template
    ├── arch-design.md            # Architecture design template
    ├── db-design.md              # Database design template
    ├── module-design.md          # Module design + API reference template
    └── test-plan.md              # Test plan + conclusion template
```

The skill uses progressive loading — `SKILL.md` is always in context, and reference templates are loaded only when the relevant document type is requested.

## Customization

You can fork this repo and modify the templates in `references/` to match your institution's thesis format. Common adjustments:

- **Chapter numbering** — change `X.X` placeholders to match your outline
- **Language** — templates are in Chinese by default; English equivalents are straightforward to add
- **Document types** — add new `.md` files under `references/` and register them in the table in `SKILL.md`

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) before opening a pull request.

Found a bug or have a feature request? [Open an issue](../../issues/new/choose).

## License

[MIT](./LICENSE) — free to use, modify, and distribute.

---

*Built with the [Claude Skills](https://docs.claude.ai) framework.*
