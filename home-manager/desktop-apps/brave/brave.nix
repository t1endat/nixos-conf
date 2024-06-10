let
ROOT = builtins.toString ./.;
in{
  # Source: https://support.brave.com/hc/en-us/articles/360039248271-Group-Policy  
  home.file."/etc/brave/policies/managed/policy.json" = {
    source = "${ROOT}/policy.json";
  };
}
