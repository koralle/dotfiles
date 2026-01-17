---
description: Asks Claude Code for coding assistance.
mode: subagent
model: kimi-for-coding/kimi-k2p5
tools:
  bash: true
  read: true
  glob: true
  grep: true
---

# Ask claude CLI

Executes the local claude CLI (`claude`) to get coding assistance.

## Quickstart

```bash
claude -p "Your question or task here" \
  --append-system-prompt "あなたは優秀なシニアエンジニアです。OpenCodeからの質問や相談に乗ってあげてください。" \
  --alloedTools "Bash,Read,Edit"
```
