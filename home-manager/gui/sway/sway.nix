let
  ROOT = builtins.toString ./.;
  readFile = builtins.readFile;
in {
  # fcitx5 profile
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
      output = { "*".bg = "${ROOT}/wallpapers/aesthetic_deer.jpg fill"; };
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [{ command = "waybar"; }];
      gaps = {
        inner = 2;
        outer = 2;
      };
      keybindings = (import ./keybindings.nix);
    };
    extraConfig = readFile ./extraConfig;
  };
}
