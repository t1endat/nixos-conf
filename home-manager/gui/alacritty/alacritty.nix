{ catppuccin-alacritty, ... }:
let 
ROOT = builtins.toString ./.;
theme = (builtins.readFile "${catppuccin-alacritty}/catppuccin-mocha.toml");
keybindings = (builtins.readFile "${ROOT}/keybindings.toml");
config = ''
  ${theme}
  ${keybindings}
'';
in {
  programs.alacritty = {
    enable = true;
    settings = (builtins.fromTOML config);
  };
}
