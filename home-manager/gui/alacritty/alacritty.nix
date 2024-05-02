{ catppuccin-alacritty, ... }:
let ROOT = builtins.toString ./.;
in {
  programs.alacritty = {
    enable = true;
    settings = (builtins.fromTOML 
      (builtins.readFile "${catppuccin-alacritty}/catppuccin-mocha.toml") 
    ); 
  };
}
