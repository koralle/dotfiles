{ pkgs, ... }:
{
  # Homebrew
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      # GitHub CLI
      # https://cli.github.com/
      "gh"

      # Gemini CLI
      # https://github.com/google-gemini/gemini-cli
      # "gemini-cli"

      # Lua
      # https://github.com/LuaLS/lua-language-server
      "lua-language-server"

      # Podman
      # https://github.com/containers/podman
      "podman"

      # Turso
      # https://turso.tech/
      # "tursodatabase/tap/turso"

      # peco
      "peco"

      # ghq
      "ghq"

      # Gemini CLI
      # https://github.com/google-gemini/gemini-cli
      "gemini-cli"

      # direnv
      # https://github.com/nix-community/nix-direnv
      "direnv"
    ];

    casks = [
      {
        # Visual Studio Code
        # https://github.com/microsoft/vscode
        name = "visual-studio-code";
      }

      {
        # Ghostty
        # https://github.com/ghostty-org/ghostty
        name = "ghostty";
      }

      {
        # Firefox
        # https://github.com/mozilla-firefox/firefox
        name = "firefox";
      }

      {
        # Raycast
        # https://www.raycast.com/
        name = "raycast";
      }

      {
        # Zed
        # https://github.com/zed-industries/zed
        name = "zed";
      }

      {
        # Google Chrome
        # https://github.com/googlechrome
        name = "google-chrome";
      }

      {
        # Aerospace
        # https://github.com/nikitabobko/AeroSpace
        name = "nikitabobko/tap/aerospace";
      }

      {
        # Discord
        name = "discord";
      }

      {
        # Claude Code
        # https://github.com/anthropics/claude-code
        name = "claude-code";
      }

      {
        # Docker
        name = "docker";
      }

      {
        # DBeaver
        name = "dbeaver-community";
      }

      {
        # Obsidian
        name = "obsidian";
      }

      {
        # Httpie
        name = "httpie";
      }
    ];
  };
}
