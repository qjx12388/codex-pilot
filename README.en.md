# codex-pilot

[简体中文](README.md) | [繁體中文](README.zh-TW.md) | **English** | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Español](README.es.md) | [हिन्दी](README.hi.md)

A Codex advisor skill: it turns your natural-language requests into the optimal way to drive Codex / codex-cli — and then executes them autonomously.

It ships with a bundled offline knowledge pack (distributed as an archive, auto-extracted during installation). When Codex loads this skill, it first consults the knowledge base through a topic routing table, presents an "optimal usage plan" (which feature / command / config / prompt style to use, with references), and then carries out your task without pausing.

## Install

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # symlink install (recommended; repo edits take effect immediately)
./scripts/install.sh --copy   # or a standalone copy
```

The installer automatically unpacks the bundled knowledge pack. After installation the skill lives at `~/.agents/skills/codex-pilot/` and works in Codex CLI, the IDE extension, and the ChatGPT desktop app, in any project (restart Codex if it does not appear).

## Usage

- Explicit trigger: type `$codex-pilot` in Codex, e.g. `$codex-pilot how do I run codex in CI?`
- Implicit trigger: just ask a Codex usage question, e.g. "what sandbox modes does codex have and how do I configure them?"
- After presenting the plan, Codex immediately executes your actual task (high-risk operations ask for your confirmation first).

## Repository structure

```
SKILL.md              skill entry point: trigger description + workflow + topic routing table
data/knowledge.pack   bundled offline knowledge pack (auto-extracted to knowledge/ at install)
scripts/              install.sh installer; update-knowledge.sh for maintainers to refresh the pack
```

`data/knowledge.pack` is a binary archive containing third-party documentation; its contents remain the property of their respective authors. Only the archive is distributed — the extracted `knowledge/` directory is not tracked (see `.gitignore`).

## License

MIT © corrin (applies only to the original content of this repository: SKILL.md, scripts/, README)
