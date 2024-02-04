{ pkgs, ...}:
{
  programs.alacritty = {
    enable = true;
    settings.import = [ pkgs.alacritty-theme.catppuccin_mocha ];
  };
}
