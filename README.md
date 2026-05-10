# thesis-doc-agent

> 一个 Claude Skill，读取你的项目代码与对话历史，自动生成可直接用于毕业论文的软件工程文档。

**[English Documentation](./README.en.md)**

---

## 这是什么

`thesis-doc-agent` 是一个面向 Claude Code 及兼容 AI coding agent 的 Skill。给定项目代码库或对话历史，它会自动完成：

- 从多个软件工程维度分析项目
- 生成语言严谨、符合学术规范的毕业论文文档
- **强制代码溯源** — 所有代码引用均标注精确文件路径与行号范围
- 自动生成 Mermaid 架构图、ER 图、时序图等

适用于计算机科学 / 软件工程专业学生，用于系统性整理毕业设计的工程文档。

## 支持的文档类型

| 文档类型 | 对应论文章节 |
|---------|------------|
| 需求分析文档 | 第二章 · 需求分析 |
| 技术架构设计 | 第三章 · 系统设计 |
| 数据库设计文档 | 第三章 · 系统设计 |
| API 接口文档 | 第三章 / 附录 |
| 模块详细设计 | 第四章 · 系统实现 |
| 测试方案与结果 | 第五章 · 系统测试 |
| 总结与展望 | 第六章 · 总结 |

## 安装

### 前置条件

- [Claude Code](https://claude.ai/code) 或其他支持 `.skill` 格式的 agent 环境
- 项目代码库（任意语言）和 / 或 Claude 对话历史

### 从 Release 安装

1. 从 [Releases](../../releases) 页面下载 `thesis-doc-agent.skill`
2. 将其放入你的 skills 目录（例如 `~/.claude/skills/`）
3. 下次会话时自动生效

### 从源码安装

```bash
git clone https://github.com/xiangshenchi/thesis-doc-agent.git
# 将 skill 文件夹复制到你的 skills 挂载路径
cp -r thesis-doc-agent ~/.claude/skills/
```

## 使用方法

安装后，直接用自然语言描述需求即可，Skill 会自动识别并触发：

```
"帮我生成需求分析文档"
"分析一下我的项目架构"
"帮我写论文的系统设计章节"
"从我的模型文件生成 ER 图"
"根据路由文件生成 API 接口文档"
"分析我的代码，整理成毕业论文材料"
```

### 典型使用流程

```
你：我的后端项目已经写完了，帮我分析代码库，
    生成毕业论文的系统架构设计章节。

Claude：[读取 SKILL.md → 扫描项目文件 → 生成文档]

# 输出内容包括：
# - 系统架构图（Mermaid）
# - 带选型理由的技术栈表格
# - 标注精确文件路径的模块说明
# - 可直接复制粘贴的学术风格正文
```

### 代码溯源的实际效果

生成文档中所有代码引用均遵循以下格式：

```
**来源：** `src/api/auth/router.py`，第 45–78 行
**功能说明：** JWT 登录接口，验证用户凭据并签发 Token

[代码片段]
```

Skill 指令中明确禁止出现"在认证模块中…"这类无路径的模糊引用。

## 文件结构

```
thesis-doc-agent/
├── SKILL.md                      # 核心指令（入口文件）
├── references/
│   ├── req-analysis.md           # 需求分析文档模板
│   ├── arch-design.md            # 技术架构设计模板
│   ├── db-design.md              # 数据库设计模板
│   ├── module-design.md          # 模块设计 + API 接口模板
│   └── test-plan.md              # 测试方案 + 总结展望模板
└── example/                      # 完整使用示例
    ├── README.md                 # 示例说明
    ├── memos-worker/             # 示例开源项目
    └── docs/                     # 使用 skill 生成的完整文档
        ├── 1-需求分析.md
        ├── 2-技术架构.md
        ├── 3-数据库设计.md
        └── 4-模块设计.md
```

Skill 采用渐进式加载 — `SKILL.md` 始终在上下文中，各类模板文件仅在请求对应文档时才被加载，节省上下文空间。

## 示例

查看 `example/` 目录下的完整使用示例：

- **示例项目**：[memos-worker](https://github.com/souvenp/memos-worker) - 一个基于 Cloudflare Workers 的无服务器笔记应用
- **生成的文档**：[example/docs/](example/docs/) - 使用本 skill 生成的完整软件工程文档

示例展示了如何从一个真实的开源项目生成：
- 需求分析文档
- 技术架构设计文档
- 数据库设计文档
- 模块详细设计文档

## 自定义

Fork 本仓库后，可修改 `references/` 下的模板以适配你所在学校的论文格式，常见调整包括：

- **章节编号** — 将 `X.X` 占位符替换为你的论文大纲编号
- **语言** — 模板默认为中文，也可在 `references/` 下添加英文版本
- **文档类型** — 在 `references/` 下添加新的 `.md` 模板，并在 `SKILL.md` 的文档类型表格中注册

## 参与贡献

欢迎参与贡献！提交 Pull Request 前请先阅读 [CONTRIBUTING.md](./CONTRIBUTING.md)。

发现 Bug 或有功能建议？[提交 Issue](../../issues/new/choose)

## 开源协议

[MIT](./LICENSE) — 可自由使用、修改与分发。

---

*基于 [Claude Skills](https://docs.claude.ai) 框架构建。*
