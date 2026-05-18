{ pkgs, username, ... }: {
  users.users.${username} = {
    home = "/Users/${username}";

    packages = with pkgs; [
      # QEMU
      # https://github.com/qemu/qemu
      qemu

      # Podman
      # https://github.com/containers/podman
      podman
      podman-compose

      # ripgrep (rg)
      # https://github.com/BurntSushi/ripgrep
      ripgrep

      # eza
      # https://github.com/eza-community/eza
      eza

      # fd
      # https://github.com/sharkdp/fd
      fd

      # Zellij
      # https://github.com/zellij-org/zellij
      zellij

      # zoxide
      # https://github.com/ajeetdsouza/zoxide
      zoxide

      # bat
      # https://github.com/sharkdp/bat
      bat

      # fzf
      # https://github.com/junegunn/fzf
      fzf
    ];

    shell = pkgs.fish;
  };
}
