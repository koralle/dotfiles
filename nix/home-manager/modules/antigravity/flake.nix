{ ... }:
{
  xdg.configFile."antigravity/user" = {
    enable = true;
    recursive = true;
    source = ./user;
  };
}
