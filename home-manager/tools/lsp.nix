{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # lsp for nix
    nodePackages.bash-language-server # lsp fo sh  
    marksman # lsp for markdown
  ];
}
