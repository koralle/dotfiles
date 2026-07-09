{ pkgs, username, ... }: {
  environment = {
    systemPackages = with pkgs; [
      vim
      wget

      # QEMU
      # https://github.com/qemu/qemu
      qemu

      # Podman
      # https://github.com/containers/podman
      podman
      podman-compose

      # jq
      # https://github.com/jqlang/jq
      jq

      # zoxide
      # https://github.com/ajeetdsouza/zoxide
      zoxide
    ];

    variables = {
      TERM = "xterm-256color";
      COLORTERM = "truecolor";
      EDITOR = "nvim";
      XDG_CONFIG_HOME = "/Users/${username}/.config";
      XDG_CACHE_HOME = "/Users/${username}/.cache";
      XDG_DATA_HOME = "/Users/${username}/.local/share";
      XDG_STATE_HOME = "/Users/${username}/.local/state";

      # VSCodeのPortable Mode
      # https://code.visualstudio.com/docs/editor/portable
      VSCODE_PORTABLE = "/Users/${username}/.config/vscode";
    };
  };
}