{ pkgs, astro-nvim, ... }:

{
  home.file.".config/nvim" = {
    # source = ./astronvim_user;
    source = "${astro-nvim}";
    recursive = true;
  };

  #home.file.".config/nvim/lua/user" = {
  #  source = ./astronvim_user;
  #  recursive = true;
  #};

  home.packages = with pkgs; [
    # config editor
    neovim

    # required packages
    lazygit
  ];
}
