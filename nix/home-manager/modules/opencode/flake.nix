{ ... }:
{
  xdg.configFile."opencode/config.json" = {
    enable = true;
    source = ./config.json;
  };
}
