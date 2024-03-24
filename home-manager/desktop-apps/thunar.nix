{
  # source: https://nixos.wiki/wiki/Thunar
  # thunar file manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };
}
