{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "run,drun";
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}
