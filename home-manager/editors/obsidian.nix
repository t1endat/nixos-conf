{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # note editor
    obsidian
  ];
}
