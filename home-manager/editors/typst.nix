{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.typst # alternative for latext 
    unstable.typst-lsp # lsp
    unstable.typstyle # formatter
  ];
}
