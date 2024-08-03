{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # lsp for nix
    nixfmt-rfc-style # nix formatter
    nodePackages.bash-language-server # lsp fo sh  
    markdown-oxide# lsp for markdown
  ];
}
