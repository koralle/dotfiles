{ ... }:
{
  xdg.configFile = {
    "zed/settings.json" = {
      enable = true;
      source = ./settings.json;
    };

    "zed/keymap.json" = {
      enable = true;
      source = ./keymap.json;
    };
  };
}
