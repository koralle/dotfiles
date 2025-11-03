{ ... }:
{
  xdg.configFile."git/config" = {
    enable = true;
    source = ./gitconfig;
  };

  xdg.configFile."git/ignore" = {
    enable = true;
    source = ./gitignore;
  };
}
