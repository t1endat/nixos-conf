{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # helix editor
    helix
  ];
}
