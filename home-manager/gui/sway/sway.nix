{ pkgs, ... }:
let ROOT = builtins.toString ./.;
in {
  # create symlink for fcitx5 profile 
  home.file.".config/fcitx5" = {
    source = ./fcitx5;
    recursive = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      input = {
        "type:touchpad" = {
          tap = "enable";
          natural_scroll = "enable";
          scroll_factor = "0.5";
        };

        "type:pointer".accel_profile = "flat";
      };
      # output = { "*".bg = "${ROOT}/wallpapers/aesthetic_deer.jpg fill"; };
      output = { "*".bg = "${ROOT}/wallpapers/aesthetic_deer.jpg fill"; };
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [{ command = "waybar"; }];

      # source: https://www.youtube.com/watch?v=QAmTUkzpIiM
      gaps = {
        inner = 2;
        outer = 2;
      };

      # keybindings = (import ./keybindings.nix);
      keybindings = (import ./keybindings.nix { inherit pkgs; });
    };
    extraConfig = builtins.readFile ./extraConfig;
  };
}
