# codex-pilot

[简体中文](README.md) | [繁體中文](README.zh-TW.md) | [English](README.en.md) | **Français** | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Español](README.es.md) | [हिन्दी](README.hi.md)

Un skill conseiller pour Codex : il transforme vos demandes en langage naturel en la meilleure façon d'utiliser Codex / codex-cli — puis les exécute de manière autonome.

Il embarque une base de connaissances hors ligne (distribuée sous forme d'archive, extraite automatiquement à l'installation). Lorsque Codex charge ce skill, il consulte d'abord la base de connaissances via une table de routage thématique, présente un « plan d'utilisation optimal » (quelle fonctionnalité / commande / configuration / forme de prompt utiliser, avec références), puis accomplit votre tâche sans pause.

## Installation

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # installation par lien symbolique (recommandée, les modifications du dépôt prennent effet immédiatement)
./scripts/install.sh --copy   # ou copie autonome
```

Le script d'installation extrait automatiquement le pack de connaissances. Après installation, le skill se trouve dans `~/.agents/skills/codex-pilot/` et fonctionne dans Codex CLI, l'extension IDE et l'application de bureau ChatGPT, pour tout projet (redémarrez Codex s'il n'apparaît pas).

## Utilisation

- Déclenchement explicite : tapez `$codex-pilot` dans Codex, par ex. `$codex-pilot comment exécuter codex en CI ?`
- Déclenchement implicite : posez directement une question d'utilisation, par ex. « quels sont les modes sandbox de codex et comment les configurer ? »
- Après avoir présenté le plan, Codex exécute immédiatement votre tâche (les opérations à risque demandent d'abord votre accord).

## Structure du dépôt

```
SKILL.md              point d'entrée du skill : description de déclenchement + flux de travail + table de routage
data/knowledge.pack   pack de connaissances hors ligne intégré (extrait vers knowledge/ à l'installation)
scripts/              install.sh pour l'installation ; update-knowledge.sh pour les mainteneurs
```

`data/knowledge.pack` est une archive binaire contenant de la documentation tierce ; son contenu reste la propriété de ses auteurs respectifs. Seule l'archive est distribuée — le dossier `knowledge/` extrait n'est pas suivi (voir `.gitignore`).

## Licence

MIT © corrin (s'applique uniquement au contenu original de ce dépôt : SKILL.md, scripts/, README)
