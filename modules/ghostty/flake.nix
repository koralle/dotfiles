{ ... }:
{
  xdg.configFile."ghostty/config" = {
    enable = true;
    source = ./ghostty.config;
  };
}
