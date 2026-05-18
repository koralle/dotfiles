{ ... }: {
  xdg.configFile."herdr/config.toml" = {
    enable = true;
    source = ./config.toml;
  };
}
