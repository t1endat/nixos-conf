{ pkgs, libre-dictionaries,... }:

{
  # doom config
  home.file.".config/doom" = {
    source = ./doom;
    recursive = true;
  };

  # library for spelling
  # source: https://passingcuriosity.com/2017/emacs-hunspell-and-dictionaries/
  home.file."Library/Spelling" = {
    source = "${libre-dictionaries}/en";
    recursive = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;
  };

  home.packages = with pkgs; [
    # required packages
    fzf
    hunspell
    wordnet
    nodejs
    sqlite # required by roam
    libvterm
    cmake
    gnumake
    libtool
  ];
}
