{ ... }:
{
  xdg.configFile."git/config" = {
    enable = true;
    source = ./gitconfig;
  };
}
