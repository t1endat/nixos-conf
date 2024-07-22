{ pkgs, ... }: {
  home.packages = with pkgs; [
    # lazydocker # docker 
    podman-tui # podman
   ];

  programs = {
    imv.enable = true; # image viewer
    mpv.enable = true; # video viewer
    lazygit.enable = true; # git
    btop.enable = true; # system monitor
  };
}
