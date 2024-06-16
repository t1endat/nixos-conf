{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # lsp for nix
    nodePackages.bash-language-server # lsp fo sh  
    markdown-oxide# lsp for markdown
    typos-lsp # lsp for spell checker
  ];
}
