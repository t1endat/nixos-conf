{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typst # alternative for latext 
    typst-lsp # lsp
    typstyle # formatter
  ];
}
