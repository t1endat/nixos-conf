{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Visual_Studio_Code
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # dracula-theme.theme-dracula
      # vscodevim.vim
      # yzhang.markdown-all-in-one
    ];
    # source: https://www.reddit.com/r/NixOS/comments/17cc4d7/electron_apps_on_nixos_nvidia_wayland_hyprland/
    userSettings = { 
      "window.titleBarStyle" = "custom"; 
    };
  };
}
