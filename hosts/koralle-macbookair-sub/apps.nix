{ ... }:
{
  # Homebrew
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;

      cleanup = "uninstall";
    };

    brews = [
      # marksman
      # https://github.com/artempyanykh/marksman
      "marksman"

      # mac-cleanup-go
      # https://github.com/2ykwang/mac-cleanup-go
      "mac-cleanup-go"
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
        # Discord
        name = "discord";
      }

      {
        # Obsidian
        name = "obsidian";
      }

      {
        # Httpie
        name = "httpie-desktop";
      }

      {
        # Antigravity
        name = "antigravity";
      }

      {
        # Aerospace
        # https://github.com/nikitabobko/AeroSpace
        name = "nikitabobko/tap/aerospace";
      }
      {
        # Tailscale
        name = "tailscale-app";
      }
      {
        # Podman Desktop
        name = "podman-desktop";
      }
      {
        # Blender
        name = "blender";
      }
    ];
  };

  launchd.agents = { };
}
