{ pkgs, ... }: {
  home.packages = with pkgs; [
    wabt # binary toolkit
    wasmtime # runtime
    wamr # micro Runtime
  ];
}
