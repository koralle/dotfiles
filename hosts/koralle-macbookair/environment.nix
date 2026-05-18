{ pkgs, username, ... }: {
  environment = {
    systemPackages = with pkgs; [
      git
      vim
      wget

      # jq
      # https://github.com/jqlang/jq
      jq

      # gnupg
      gnupg
    ];

    variables = {
      COLORTERM = "truecolor";
      EDITOR = "nvim";
      XDG_CONFIG_HOME = "/Users/${username}/.config";
      XDG_CACHE_HOME = "/Users/${username}/.cache";
      XDG_DATA_HOME = "/Users/${username}/.local/share";
      XDG_STATE_HOME = "/Users/${username}/.local/state";
    };
  };
}
