{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal
    nushell # mordern shell

    # cli tools
    bat # alternative of cat
    fd # alternative of find
    zoxide # alternative of cd
    ripgrep # recursively searches directories
    eza # a modern replacement for ls
    thefuck # corrects your previous console command
    du-dust # a more intuitive version of du in rust
    silver-searcher # a code-searching tool similar to ack, but faster
    tldr # collaborative cheatsheets for console commands
    atuin # history shell
    trash-cli # alternative for rm
    rclone # drive cmdline tool
    neofetch # system info script
    screen # multiplexes a physical terminal
    just # A handy way to save and run project-specific commands
    appimage-run # run appimage application
    unzip # .zip files
    # rar # .rar files
    _7zz # 7z files
    dict # dictionary 
    nh
  ];
}
