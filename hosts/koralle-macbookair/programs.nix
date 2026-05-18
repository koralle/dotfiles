{ ... }: {

  programs.fish = {
    enable = true;

    shellInit = ''
      # vi mode
      fish_vi_key_bindings

      # Initialize zoxide
      # https://github.com/ajeetdsouza/zoxide
      zoxide init fish | source

      # Initialize mise
      # https://mise.jdx.dev/getting-started.html#_2a-activate-mise
      if status is-interactive
        mise activate fish | source
      else
        mise activate fish --shims | source
      end
    '';

    interactiveShellInit = "";

    loginShellInit = "";
  };

  # Zshの設定
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableFzfGit = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;

    shellInit = ''
      # Initialize zoxide
      # https://github.com/ajeetdsouza/zoxide
      eval "$(zoxide init zsh)"

      # Initialize mise
      # https://mise.jdx.dev/getting-started.html#activate-mise
      # eval "$(mise activate zsh)"

      # Initialize direnv
      # https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
      eval "$(direnv hook zsh)"
    '';

    loginShellInit = "";
  };
}
