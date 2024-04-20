{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Fonts#Installing_fonts_on_NixOS
  # global fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "IntelOneMono" ]; })
      corefonts
      noto-fonts
      noto-fonts-cjk
      # noto-fonts-emoji
      font-awesome
      papirus-icon-theme # for rofi
    ];
    fontconfig.defaultFonts = {
      serif = [ "IntoneMono Nerd Font Mono" ];
      sansSerif = [ "IntoneMono Nerd Font Mono" ];
      monospace = [ "IntoneMono Nerd Font Mono" ];
      emoji = [ "IntoneMono Nerd Font Mono" ];
      # emoji = [ "Font Awesome 6 Free" ];
    };
  };
}
