{ pkgs, ... }:
{
  # Homebrew
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
    };

    brews = [ ];

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
        name = "httpie";
      }

      {
        # Antigravity
        name = "antigravity";
      }

      {
        # Tailscale
        name = "tailscale";
      }
    ];
  };
}
