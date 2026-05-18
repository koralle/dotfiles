{ ... }:
{
  xdg.configFile."fish/config.fish" = {
    enable = true;
    source = ./config.fish;
  };

  xdg.configFile."fish/conf.d" = {
    enable = true;
    source = ./conf.d;
    recursive = true;
  };
}
