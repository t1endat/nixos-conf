{ pkgs, ... }:

{
  home.file.".config/nvim/lua" = {
    source = ./lazyvim/lua;
    recursive = true;
  };

  home.packages = with pkgs; [
    # config editor
    neovim

    # required packages
    lazygit
  ];
}
