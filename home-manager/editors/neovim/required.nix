{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # config editor
    neovim

    # required packages
    lazygit
  ];
}
