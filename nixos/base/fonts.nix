{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Fonts#Installing_fonts_on_NixOS
  # global fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      intel-one-mono
      corefonts
      noto-fonts
      noto-fonts-cjk
      # noto-fonts-emoji
      font-awesome
      papirus-icon-theme # for rofi
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
    fontconfig.defaultFonts = {
      serif = [ "Intel One Mono" ];
      sansSerif = [ "Intel One Mono" ];
      monospace = [ "Intel One Mono" ];
      # emoji = [ "Font Awesome 6 Free" ];
      emoji = [ "Symbols Nerd Font" ];
    };
  };
}
