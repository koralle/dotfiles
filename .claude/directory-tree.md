# ディレクトリ構成

```
/
   ├─ .claude
   ├─ .config
   │     ├─ bat
   │     │     └─ config  // `bat` コマンドの設定
   │     ├─ fish          // Fish シェルの設定
   │     │     ├─ conf.d
   │     │     │     └─ alias.fish
   │     │     └─ config.fish
   │     ├─ ghostty
   │     │     └─ config  // ターミナルエミュレータ Ghostty の設定 => https://ghostty.org/
   │     ├─ git
   │     │     └─ config  // `git` コマンドの設定 
   │     ├─ mise
   │     │     └─ config.toml `mise` コマンドの設定 => https://mise.jdx.dev/
   │     ├─ nvim
   │     │     ├─ ftplugin
   │     │     ├─ lua
   │     │     │     ├─ koralle
   │     │     │     │     ├─ configs // Neovim のグローバル設定を書く
   │     │     │     │     ├─ helpers // .config/nvim ディレクトリ下で使用するヘルパー関数を配置する
   │     │     │     │     └─ plugins // Neovim プラグインの設定を書く
   │     │     │     └─ lazy-nvim.lua // プラグインマネージャ lazy.nvim の設定を書く => https://github.com/folke/lazy.nvim
   │     │     └─ init.lua            // Neovim の設定のエントリーポイント
   │     └─ tig
   │           └─ config
   └─ system
         ├─ macos
         │     └─ home.nix // MacOS 用のNixの設定
         └─ wsl2
               └─ home.nix // WSL2 用のNixの設定
```
