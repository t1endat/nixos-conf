{ pkgs, ... }: {
  home.packages = with pkgs; [
    wabt # binary toolkit
    wasmtime # runtime
    wasmer # another runtime
  ];
}
