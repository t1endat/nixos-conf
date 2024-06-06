{ catppuccin-alacritty, ... }:
let 
ROOT = builtins.toString ./.;
# theme = (builtins.fromTOML 
#     (builtins.readFile "${catppuccin-alacritty}/catppuccin-mocha.toml"));
theme = (builtins.readFile "${catppuccin-alacritty}/catppuccin-mocha.toml");
keybindings = (builtins.readFile "${ROOT}/keybindings.toml");
b = ''
  ${theme}
  ${keybindings}
'';
in {
  programs.alacritty = {
    enable = true;
    settings = (builtins.fromTOML b);
  };
}
