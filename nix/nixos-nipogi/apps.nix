{ pkgs, ... }: {
  users.users.koralle.packages = with pkgs; [
    git
    python3
    gcc
    gnumake

    # Ghostty
    ghostty

    # Google Chrome
    google-chrome
  ];
}
