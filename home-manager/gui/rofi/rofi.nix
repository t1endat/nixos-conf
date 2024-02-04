{
  programs.rofi = {
    enable = true;
    # TODO: change to relative path
    theme = "~/nixos-conf/home-manager/gui/rofi/catppuccin-mocha.rasi";
    extraConfig = {
      modi = "run,drun";
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}
