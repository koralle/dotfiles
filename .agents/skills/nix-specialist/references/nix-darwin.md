# nix-darwin

## 1. 目的

macOS上での宣言的設定管理（nix-darwin）に関する要点と運用の注意点を確認するための参照。

## 2. 要点

- `darwin-rebuild` で設定を評価・反映する。
- `system.defaults` でDock/Finder等のmacOS設定を宣言的に管理できる。
- `homebrew` オプション群でBrewパッケージ群を統合管理できる。
- `launchd` 連携で常駐処理を宣言的に定義できる。
- activation script で反映時フックを設定できる。
- macOS固有制約により、NixOSと同一手順にならない場面がある。

## 3. オプション調査の型

1. 対象が `system.defaults`、`homebrew`、`launchd` のどれかを特定する。
2. 該当オプションの型と既定値を確認する。
3. 最小構成で反映し、OS設定やプロセス状態を検証する。

## 4. 誤りやすい点

- NixOS前提の説明をそのままmacOSへ適用する。
- HomebrewとNix管理対象の境界を曖昧にする。
- activation script に副作用の大きい処理を詰め込みすぎる。

## 5. ベストプラクティス

- 「Nixで管理する範囲」と「OS標準で管理する範囲」を明確化する。
- Homebrew統合時は責務を決め、二重管理を避ける。
- 反映後チェック項目を事前定義し、毎回同じ観点で検証する。

## 6. 主要参照

- nix-darwin Manual
- `nix-darwin` GitHub リポジトリ
