{ pkgs, catppuccin-rofi, ... }:
let ROOT = builtins.toString ./.;
in {
  home.packages = with pkgs;
    [
      papirus-icon-theme # icon for rofi
    ];

  programs.rofi = {
    enable = true;
    font = "IntoneMono Nerd Font 12";
    theme =
      "${catppuccin-rofi}/basic/.local/share/rofi/themes/catppuccin-mocha.rasi";
    extraConfig = {
      modi = "run,drun";
      lines = 5;
      show-icons = true;
      icon-theme = "Papirus";
      terminal = "st";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      sidebar-mode = true;
    };
  };
}
