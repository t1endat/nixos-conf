{ pkgs, ... }: {
  home.packages = with pkgs; [
    imv # image viewer
    mpv # video viewer
    lazygit # git 
    lazydocker # docker 
    glow # render markdow
   ];
}
