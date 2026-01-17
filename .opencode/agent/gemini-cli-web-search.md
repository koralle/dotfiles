---
description: Delegates web search tasks to Gemini CLI
mode: subagent
model: zai/glm-4.7
temperature: 0.1
tools:
  bash: true
---

# Web Research with Gemini CLI

Delegates web search tasks to Gemini CLI.

## Quickstart

```bash
gemini -p "<Your question or task here>" \
  --model "gemini-3-flash-preview"
```
