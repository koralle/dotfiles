{ ... }:
{

  xdg.configFile."vscode/user" = {
    enable = true;
    recursive = true;
    source = ./user;
  };
}
