{ pkgs, ... }: {
  programs = {
    firefox.enable = true;
  };

  users.users.koralle.packages = with pkgs; [
    google-chrome
  ];
}
