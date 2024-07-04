{ catppuccin-alacritty, ... }:
let 
ROOT = builtins.toString ./.;
# theme = (builtins.readFile "${catppuccin-alacritty}/catppuccin-mocha.toml");
keybindings = (builtins.readFile "${ROOT}/keybindings.toml");
config = ''
  ${keybindings}
'';
# ${theme}
in {
  programs.alacritty = {
    enable = true;
    settings = (builtins.fromTOML config);
  };
}
