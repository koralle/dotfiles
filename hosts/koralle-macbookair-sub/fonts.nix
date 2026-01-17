{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      moralerspace
      hackgen-font
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      udev-gothic
      udev-gothic-nf
      ibm-plex
    ];
  };
}
