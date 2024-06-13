{ pkgs, ... }:

{
  home.file.".config/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };

  home.packages = with pkgs; [
    # config editor
    neovim

    # required packages
    lazygit
    ripgrep
    llvmPackages.libcxxClang # C compiler for nvim-treesitter
    gnumake
  ];
}
