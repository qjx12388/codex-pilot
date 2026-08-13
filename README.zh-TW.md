# codex-pilot

[简体中文](README.md) | **繁體中文** | [English](README.en.md) | [Français](README.fr.md) | [Deutsch](README.de.md) | [Русский](README.ru.md) | [Español](README.es.md) | [हिन्दी](README.hi.md)

Codex 用法顧問 skill：把你的自然語言需求，轉化為對 Codex / codex-cli 的最佳調用方式，並立即自主執行。

內建離線知識庫（以壓縮包形式隨倉庫分發，安裝時自動解壓）。Codex 載入本 skill 後，會先按主題路由查閱知識庫，給出「最佳用法方案」（該用哪個功能/命令/設定/prompt 寫法，附出處），然後不停頓地按方案完成你的任務。

## 安裝 Install

```bash
git clone https://github.com/qjx12388/codex-pilot.git
cd codex-pilot
./scripts/install.sh          # 符號連結安裝（推薦，倉庫改動即時生效）
./scripts/install.sh --copy   # 或獨立拷貝安裝
```

安裝腳本會自動解壓內建知識包。安裝後 skill 位於 `~/.agents/skills/codex-pilot/`，在任何專案的 Codex CLI / IDE 擴充功能 / ChatGPT 桌面 App 中可用（如未出現請重新啟動 Codex）。

## 使用 Usage

- 顯式觸發：在 Codex 中輸入 `$codex-pilot`，例如 `$codex-pilot 怎麼在 CI 裡跑 codex？`
- 隱式觸發：直接問 Codex 用法類問題，如「codex 的沙箱模式有哪些，怎麼設定？」
- 顧問輸出方案後，Codex 會立即按方案自主執行你的實際任務（高風險操作會先徵得同意）。

## 倉庫結構

```
SKILL.md              skill 入口：觸發描述 + 工作流程 + 主題路由表
data/knowledge.pack   內建離線知識包（安裝時自動解壓為 knowledge/）
scripts/              install.sh 安裝；update-knowledge.sh 供維護者更新知識包
```

`data/knowledge.pack` 為二進位壓縮包，包含第三方文件內容，其內容版權歸原文作者所有；倉庫只分發壓縮包，解壓後的 `knowledge/` 不入庫（見 `.gitignore`）。

## License

MIT © corrin（僅適用於本倉庫原創內容：SKILL.md、scripts/、README）
