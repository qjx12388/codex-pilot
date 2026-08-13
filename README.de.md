# codex-pilot

[简体中文](README.md) | [繁體中文](README.zh-TW.md) | [English](README.en.md) | [Français](README.fr.md) | **Deutsch** | [Русский](README.ru.md) | [Español](README.es.md) | [हिन्दी](README.hi.md)

Ein Codex-Berater-Skill: Er übersetzt Ihre Anfragen in natürlicher Sprache in die optimale Art, Codex / codex-cli zu nutzen — und führt sie anschließend selbstständig aus.

Er enthält ein gebündeltes Offline-Wissenspaket (als Archiv mitgeliefert, bei der Installation automatisch entpackt). Wenn Codex diesen Skill lädt, konsultiert es zuerst über eine Themen-Routing-Tabelle die Wissensbasis, präsentiert einen „optimalen Nutzungsplan" (welche Funktion / welcher Befehl / welche Konfiguration / welcher Prompt-Stil, mit Quellenangaben) und erledigt dann Ihre Aufgabe ohne Unterbrechung.

## Installation

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # Symlink-Installation (empfohlen; Repo-Änderungen wirken sofort)
./scripts/install.sh --copy   # oder eigenständige Kopie
```

Das Installationsskript entpackt das Wissenspaket automatisch. Nach der Installation liegt der Skill unter `~/.agents/skills/codex-pilot/` und funktioniert in Codex CLI, der IDE-Erweiterung und der ChatGPT-Desktop-App — in jedem Projekt (Codex neu starten, falls der Skill nicht erscheint).

## Verwendung

- Expliziter Aufruf: `$codex-pilot` in Codex eingeben, z. B. `$codex-pilot wie führe ich codex in CI aus?`
- Impliziter Aufruf: einfach eine Nutzungsfrage stellen, z. B. „welche Sandbox-Modi hat codex und wie konfiguriere ich sie?"
- Nach dem Plan führt Codex Ihre eigentliche Aufgabe sofort aus (riskante Operationen werden vorher bestätigt).

## Repository-Struktur

```
SKILL.md              Skill-Einstiegspunkt: Trigger-Beschreibung + Arbeitsablauf + Routing-Tabelle
data/knowledge.pack   gebündeltes Offline-Wissenspaket (wird bei der Installation nach knowledge/ entpackt)
scripts/              install.sh für die Installation; update-knowledge.sh für Maintainer
```

`data/knowledge.pack` ist ein Binärarchiv mit Dokumentation Dritter; deren Inhalte bleiben Eigentum der jeweiligen Autoren. Nur das Archiv wird verteilt — das entpackte Verzeichnis `knowledge/` wird nicht versioniert (siehe `.gitignore`).

## Lizenz

MIT © corrin (gilt nur für die Originalinhalte dieses Repositories: SKILL.md, scripts/, README)
