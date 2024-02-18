{ pkgs, ... }:
{
  # reset devices list after reboot, run after init swayWM 
  systemd.services.reset-input-devices= {
    after = [ "wpa_supplicant.service" ];
    wantedBy = [ "wpa_supplicant.service" ];
    serviceConfig = {
      Type = "oneshot";
    };
    path = with pkgs; [ bash ];
    script = ''
      bash /home/tiendat/reset-input-devices.sh
    '';
  };
}
