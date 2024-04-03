{ pkgs, ... }: {
  home.packages = with pkgs; [ discord.override { nss = pkgs.nss_3_99; } ];
}
