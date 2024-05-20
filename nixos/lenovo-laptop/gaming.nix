{
  # game time!
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    # source: https://github.com/vimjoyer/nixos-gaming-video?tab=readme-ov-file#wrappers 
    gamescopeSession.enable = true;
  };
  
  programs.gamemode.enable = true;
}

