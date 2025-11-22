{ config, ... }: {
  networking.hostName = "nixos-nipogi"; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Tailscaleの有効化
  services.tailscale.enable = true;

  # Open ports in the firewall.

  networking.firewall = {
    enable = true;

    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [config.services.tailscale.port];
  };
}
