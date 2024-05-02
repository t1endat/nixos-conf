{ pkgs, ... }:

{
  home.file.".config/nvim/lua/plugins/astrocore.lua" = {
   source = ./astronvim_user/astrocore.lua;
   # recursive = true;
  };

  home.packages = with pkgs; [
    # config editor
    neovim

    # required packages
    lazygit
  ];
}
