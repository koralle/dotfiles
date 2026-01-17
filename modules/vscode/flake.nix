{ ... }:
{
  xdg.configFile."vscode/user/settings.json" = {
    enable = true;
    source = ./settings.json;
  };
}
