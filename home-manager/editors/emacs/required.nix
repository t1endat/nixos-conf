{ pkgs, ... }:

{
  # doom config
  home.file.".config/doom" = {
    source = ./doom;
    recursive = true;
  };

  # library for spelling
  home.file."Library/Spelling" = {
    source = ./dicts/en_US;
    recursive = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;
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
    sqlite # required by roam
    libvterm
    cmake
    gnumake
    libtool
  ];
}
