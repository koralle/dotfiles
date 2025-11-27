{ ... }:
{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the Cinnamon Desktop Environment.
    displayManager.lightdm.enable = true;
    desktopManager.cinnamon = {
      enable = true;

      extraGSettingsOverrides = ''
        [org.cinnamon.desktop.interface]
        font-name='Noto Sans CJK JP 12'
        gtk-theme='CBlue'
        clock-show-date=true

        [org.cinnamon.desktop.wm.preferences]
        button-layout='close,minimize,maximize:'
      '';

      extraGSettingsOverridePackages = [ ];
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable the GNOME Desktop Environment
  # services.desktopManager.gnome.enable = true;
  # services.displayManager.gdm.enable = true;
}
