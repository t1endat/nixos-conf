{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # another editor
    helix
  ];
}
