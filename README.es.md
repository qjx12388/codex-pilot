# codex-pilot

[简体中文](README.md) | [繁體中文](README.zh-TW.md) | [English](README.en.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | **Español** | [हिन्दी](README.hi.md)

Un skill asesor para Codex: convierte tus peticiones en lenguaje natural en la forma óptima de usar Codex / codex-cli — y luego las ejecuta de forma autónoma.

Incluye una base de conocimiento sin conexión (distribuida como archivo comprimido, extraída automáticamente durante la instalación). Cuando Codex carga este skill, primero consulta la base de conocimiento mediante una tabla de enrutamiento por temas, presenta un «plan de uso óptimo» (qué función / comando / configuración / estilo de prompt usar, con referencias) y después completa tu tarea sin pausas.

## Instalación

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # instalación con enlace simbólico (recomendada; los cambios del repo surten efecto al instante)
./scripts/install.sh --copy   # o copia independiente
```

El instalador descomprime automáticamente el paquete de conocimiento. Tras la instalación, el skill queda en `~/.agents/skills/codex-pilot/` y funciona en Codex CLI, la extensión de IDE y la app de escritorio de ChatGPT, en cualquier proyecto (reinicia Codex si no aparece).

## Uso

- Activación explícita: escribe `$codex-pilot` en Codex, p. ej. `$codex-pilot ¿cómo ejecuto codex en CI?`
- Activación implícita: haz directamente una pregunta de uso, p. ej. «¿qué modos de sandbox tiene codex y cómo se configuran?»
- Tras presentar el plan, Codex ejecuta tu tarea de inmediato (las operaciones de riesgo piden confirmación primero).

## Estructura del repositorio

```
SKILL.md              entrada del skill: descripción de activación + flujo de trabajo + tabla de enrutamiento
data/knowledge.pack   paquete de conocimiento offline integrado (se extrae a knowledge/ al instalar)
scripts/              install.sh para instalar; update-knowledge.sh para que los mantenedores actualicen el paquete
```

`data/knowledge.pack` es un archivo binario con documentación de terceros; su contenido pertenece a sus respectivos autores. Solo se distribuye el archivo comprimido — el directorio extraído `knowledge/` no se versiona (ver `.gitignore`).

## Licencia

MIT © corrin (aplica solo al contenido original de este repositorio: SKILL.md, scripts/, README)
