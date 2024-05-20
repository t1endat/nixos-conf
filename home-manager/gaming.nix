{
  # source: https://github.com/vimjoyer/nixos-gaming-video?tab=readme-ov-file#protonup
  home.packages = with pkgs; [
    protonup
  ];
  
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };
}
