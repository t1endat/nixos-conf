{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Visual_Studio_Code#NixOS
  programs.vscode = {
    enable = true;
    # extensions = with pkgs.vscode-extensions; [
    #   dracula-theme.theme-dracula
    #   vscodevim.vim
    #   yzhang.markdown-all-in-one
    # ];
  };
}
