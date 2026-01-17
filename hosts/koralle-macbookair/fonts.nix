{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      moralerspace
      hackgen-font
    ];
  };
}
