{ pkgs, ... }:
let 
  ROOT = builtins.toString ./.;
in {
  # https://discourse.nixos.org/t/how-to-add-a-modprobe-reset-in-config/21423/5
  # reset devices list after reboot, run after init swayWM 
  systemd.services.reset-input-devices= {
    #NOTE: it work!
    after = [ "tlp.service" ];
    wantedBy = [ "tlp.service" ];
    serviceConfig = {
      Type = "oneshot";
    };
    path = with pkgs; [ bash ];
    script = ''
      bash ${ROOT}/reset-input-devices.sh
    '';
  };
}
