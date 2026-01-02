{ pkgs, ... }:
{
  xdg.configFile."eza/theme.yaml" = {
    enable = true;
    source = ./theme.yaml;
  };
}
