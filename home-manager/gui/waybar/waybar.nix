{ config, catppuccin-waybar,... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  readFile = builtins.readFile;
in {
  # link file 
  home.file.".config/waybar/mocha.css" = { 
    # source = symlink ./mocha.css; 
    source = "${catppuccin-waybar}/themes/mocha.css"; 
  };

  programs.waybar = {
    enable = true;
    settings = [ (import ./settings.nix) ];
    style = readFile ./style.css;
  };
}
