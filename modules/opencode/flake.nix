{
  xdg.configFile = {
    "opencode/opencode.jsonc" = {
      enable = true;
      source = ./opencode.jsonc;
    };

    "opencode/oh-my-opencode.jsonc" = {
      enable = true;
      source = ./oh-my-opencode.jsonc;
    };

    "opencode/commands" = {
      enable = true;
      source = ./opencode.jsonc;
      recursive = true;
    };
  };
}
