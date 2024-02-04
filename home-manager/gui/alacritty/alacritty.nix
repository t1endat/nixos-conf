{
  programs.alacritty = {
    enable = true;
    settings = {
      # TODO: change to relative path
      import = ["~/nixos-conf/home-manager/gui/alacritty/catppuccin-mocha.yaml"];
      # import = [ "./catppuccin-mocha.yaml"];
    };
  };
}
