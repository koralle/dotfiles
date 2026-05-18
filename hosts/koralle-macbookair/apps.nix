{ ... }:
{
  # Homebrew
  homebrew = {
    enable = true;
    enableFishIntegration = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;

      cleanup = "uninstall";
    };

    brews = [
      # mise
      # https://github.com/jdx/mise
      "mise"

      # marksman
      # https://github.com/artempyanykh/marksman
      "marksman"

      # mac-cleanup-go
      # https://github.com/2ykwang/mac-cleanup-go
      "mac-cleanup-go"

      "libsql/sqld/sqld"
      "tursodatabase/tap/turso"

      # betterleaks
      # https://github.com/betterleaks/betterleaks
      "betterleaks"
    ];

    casks = [
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
        # OpenCode Desktop
        name = "opencode-desktop";
      }
    ];
  };

  launchd.agents = { };
}
