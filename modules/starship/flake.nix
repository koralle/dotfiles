{ pkgs, ... }:
{
  xdg.configFile."starship/config.toml" = {
    enable = true;
    source = ./config.toml;
  };
}
