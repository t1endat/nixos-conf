{ pkgs, ... }: {
  home.packages = with pkgs; [
    mujoco
   ];
}
