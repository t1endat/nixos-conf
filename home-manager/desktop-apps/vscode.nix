{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Visual_Studio_Code
  programs.vscode = {
    enable = true;
    # source: https://www.reddit.com/r/NixOS/comments/17cc4d7/electron_apps_on_nixos_nvidia_wayland_hyprland/
    userSettings = { 
      "window.titleBarStyle" = "custom"; 
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
    };
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc 
      catppuccin.catppuccin-vsc-icons
      vscodevim.vim
      mkhl.direnv
      ms-vscode.cpptools
      # platformio.platformio-ide
      usernamehw.errorlens
    ];
  };
}
