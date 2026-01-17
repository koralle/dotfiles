---
description: Asks Gemini CLI for coding assistance.
mode: subagent
model: kimi-for-coding/kimi-k2p5
tools:
  bash: true
  read: true
  glob: true
  grep: true
---

# Ask Gemini CLI

Executes the local Gemini CLI (`gemini`) to get coding assistance.

## Quickstart

```bash
gemini -p "Your question or task here" \
  --model "gemini-3-flash-preview" \
  --yolo
```
