{ pkgs, ... }: {
  users.users.koralle.packages = with pkgs; [
    git
    python3
    gcc
    gnumake

    # Ghostty
    ghostty

    # Discord
    discord

    # Zed Editor
    # https://github.com/zed-industries/zed
    zed-editor

    # Visual Studio Code
    # https://github.com/microsoft/vscode
    vscode

    # Chromium
    chromium
  ];
}
