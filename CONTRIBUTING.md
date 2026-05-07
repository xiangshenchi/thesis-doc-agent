# Contributing to thesis-doc-agent

Thank you for considering a contribution! This project is intentionally lightweight — a set of Markdown instruction files — so contributions are accessible to anyone, no coding required.

**[中文贡献指南](#中文贡献指南)**

---

## Ways to contribute

- **Improve templates** — make existing document templates more complete or accurate
- **Add document types** — new thesis sections not yet covered (e.g. deployment docs, user manuals)
- **Add language support** — translate templates for non-Chinese thesis formats
- **Fix bugs** — incorrect instructions, broken Mermaid syntax, formatting issues
- **Share examples** — real (anonymized) outputs you generated with this skill

## Before you start

- Check [open issues](../../issues) to avoid duplicating effort
- For significant changes, open an issue first to discuss the approach
- Keep templates general — they should work across different tech stacks and universities

## Pull request process

1. Fork the repo and create a branch: `git checkout -b feat/your-feature-name`
2. Make your changes
3. Test manually: copy the modified skill into a Claude session and run a realistic prompt against it
4. Update the relevant README sections if your change affects usage or structure
5. Open a PR with a clear description of what changed and why

### PR title format

```
feat: add deployment architecture template
fix: correct Mermaid ER diagram syntax
docs: improve installation instructions
refactor: simplify code traceability rules
```

## Template editing guidelines

- **Keep academic tone** — templates should produce text that reads like a thesis, not a blog post
- **File paths are mandatory** — any template that references code must include a path placeholder; never omit this
- **Explain the "why"** — templates should prompt the agent to justify design decisions, not just describe them
- **Test your Mermaid** — paste diagrams into [mermaid.live](https://mermaid.live) before submitting

## Reporting issues

Use the issue templates provided:

- **Bug report** — something the skill generates incorrectly
- **Feature request** — a document type or workflow not yet supported

## Code of conduct

Be respectful and constructive. This is a small community project — we're all here to make thesis writing a little less painful.

---

## 中文贡献指南

感谢你考虑参与贡献！本项目本质上是一组 Markdown 指令文件，贡献门槛很低，无需编程背景。

### 可以贡献的方向

- **完善模板** — 让现有文档模板更完整、更准确
- **新增文档类型** — 补充尚未覆盖的论文章节（如部署文档、用户手册等）
- **多语言支持** — 为非中文论文格式添加对应模板
- **修复问题** — 错误的指令、失效的 Mermaid 语法、格式问题
- **分享示例** — 提交（脱敏后的）真实使用输出，帮助其他人了解效果

### 提交 PR 前

- 先查看 [现有 Issue](../../issues)，避免重复工作
- 较大改动请先开 Issue 讨论方案
- 模板应保持通用性，适配不同技术栈和学校格式

### 模板编写规范

- **学术语气** — 生成的文本应该像论文，而不是博客文章
- **文件路径必填** — 所有引用代码的模板都必须包含路径占位符，不可省略
- **说明"为什么"** — 模板应引导 agent 解释设计决策的原因，而不只是描述现象
- **验证 Mermaid 语法** — 提交前在 [mermaid.live](https://mermaid.live) 测试图表
