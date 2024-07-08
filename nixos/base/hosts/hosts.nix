let
  ROOT = builtins.toString ./.;
  extra-hosts = (builtins.readFile "${ROOT}/extra-hosts");
  workmode-hosts = (builtins.readFile "${ROOT}/workmode-hosts");
  social-hosts = (builtins.readFile "${ROOT}/social-hosts");
in {
  # source:  https://nixos.org/manual/nixos/stable/#sec-configuration-file
  networking.extraHosts = ''
    ${extra-hosts}
    ${workmode-hosts}
    ${social-hosts}
  '';
}
