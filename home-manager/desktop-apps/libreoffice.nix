{ pkgs, ... }: {
  home.packages = with pkgs; [
    libreoffice-qt # office tools
    hunspell # spell checking
  ];
}
