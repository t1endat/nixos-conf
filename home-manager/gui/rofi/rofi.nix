let 
  ROOT = builtins.toString ./.;
in {
  programs.rofi = {
    enable = true;
    theme = "${ROOT}/theme.rasi";
    extraConfig = {
      modi = "run,drun";
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}
