{ ... }:
{
  xdg.configFile."rtk/config.toml" = {
    enable = true;
    source = ./config.toml;
  };
}
