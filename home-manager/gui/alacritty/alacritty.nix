{ ... }:
let 
ROOT = builtins.toString ./.;
keybindings = (builtins.readFile "${ROOT}/keybindings.toml");
config = ''
  ${keybindings}
'';
in {
  programs.alacritty = {
    enable = true;
    settings = (builtins.fromTOML config);
  };
}
