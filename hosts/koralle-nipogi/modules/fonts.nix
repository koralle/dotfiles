{ pkgs, ... }:
{

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      hackgen-font
      hackgen-nf-font
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Serif CJK JP"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK JP"
        ];
        monospace = [
          "Noto Sans Mono"
          "Noto Sans Mono CJK JP"
        ];
      };
    };
  };
}
