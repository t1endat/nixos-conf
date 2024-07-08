let
  ROOT = builtins.toString ./.;
  extra-hosts = (builtins.readFile "${ROOT}/extra-hosts");
in {
  # source:  https://nixos.org/manual/nixos/stable/#sec-configuration-file
  networking.extraHosts = ''
    ${extra-hosts}
  '';
}
