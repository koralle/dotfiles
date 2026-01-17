{ lib, pkgs, username, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./apps.nix

    ./modules/browser.nix
    ./modules/fonts.nix
    ./modules/gpg.nix
    ./modules/gui.nix
    ./modules/i18n.nix
    ./modules/networking.nix
    ./modules/ssh.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "koralle";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };

  # Install nix-ld
  programs.nix-ld.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -Ux XDG_CONFIG_HOME $HOME/.config
      set -Ux MISE_ALL_COMPILE false

      # vi mode
      fish_vi_key_bindings

      # Initialize zoxide
      # https://github.com/ajeetdsouza/zoxide
      zoxide init fish | source

      # Initialize Starship
      # https://starship.rs/ja-JP/guide/
      starship init fish | source

      # Initialize mise
      # https://mise.jdx.dev/getting-started.html#_2a-activate-mise
      if status is-interactive
        mise activate fish | source
      else
        mise activate fish --shims | source
      end

      # Initialize bat
      if command -q bat
        bat --completion fish | source
      end
    '';
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    vim
    wget

    virtiofsd

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
  ];

  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
