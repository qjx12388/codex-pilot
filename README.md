# codex-pilot

**简体中文** | [繁體中文](README.zh-TW.md) | [English](README.en.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Español](README.es.md) | [हिन्दी](README.hi.md)

Codex 用法顾问 skill：把你的自然语言需求，转化为对 Codex / codex-cli 的最佳调用方式，并立即自主执行。

内置离线知识库（压缩包形式随仓库分发，安装时自动解压）。Codex 加载本 skill 后，会先按主题路由查阅知识库，给出"最佳用法方案"（该用哪个功能/命令/配置/prompt 写法，附出处），然后不停顿地按方案完成你的任务。

## 安装 Install

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # 符号链接安装（推荐，仓库改动即时生效）
./scripts/install.sh --copy   # 或独立拷贝安装
```

安装脚本会自动解压内置知识包。安装后 skill 位于 `~/.agents/skills/codex-pilot/`，在任何项目的 Codex CLI / IDE 扩展 / ChatGPT 桌面 App 中可用（如未出现请重启 Codex）。

## 使用 Usage

- 显式触发：在 Codex 中输入 `$codex-pilot`，例如 `$codex-pilot 怎么在 CI 里跑 codex？`
- 隐式触发：直接问 Codex 用法类问题，如"codex 的沙箱模式有哪些，怎么配？"
- 顾问输出方案后，Codex 会立即按方案自主执行你的实际任务（高风险操作会先征得同意）。

## 仓库结构

```
SKILL.md              skill 入口：触发描述 + 工作流程 + 主题路由表
data/knowledge.pack   内置离线知识包（安装时自动解压为 knowledge/）
scripts/              install.sh 安装；update-knowledge.sh 供维护者更新知识包
```

`data/knowledge.pack` 为二进制压缩包，包含第三方文档内容，其内容版权归原文作者所有；仓库只分发压缩包，解压后的 `knowledge/` 不入库（见 `.gitignore`）。

## License

MIT © corrin（仅适用于本仓库原创内容：SKILL.md、scripts/、README）
