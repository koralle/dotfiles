{ pkgs, ... }:
{
  xdg.configFile."mise/config.toml" = {
    enable = true;
    source = ./config.toml;
  };
}
