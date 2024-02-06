{ pkgs, ... }:

{
  home.file.".config/doom" = {
    source = ./doom;
    recursive = true;
  };
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  
  };

  home.packages = with pkgs; [
    # required packages
    fzf
    languagetool
    hunspell
    mpd
    mpc-cli
    wordnet
    nodejs 
    libvterm
    sqlite # required by roam
  ];
}
