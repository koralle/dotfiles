# リポジトリコンテキスト

## 概要

- リポジトリ名: dotfiles
- 技術スタック: 主にNix, Lua, TypeScript
- 目標: Windows (WSL2) / MacOS / Linux とOSに関わらずポータビリティに優れたdotfilesの構築

## 制約

- NixについてはNix Flakes, home-managerを使用する

## 技術選定について

- Nix ... 再現性の高いビルドを実現
- Lua ... Neovimの設定を作成

