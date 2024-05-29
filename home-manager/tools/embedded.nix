{ pkgs, ... }: {
  home.packages = with pkgs; [
    qemu # machine emulator
    # platformio # embedded tool
    # openocd # On-Chip Debugging
    # gdb # The GNU Project debugger
    # cargo-binutils # invoke the LLVM tools shipped
    # cargo-generate # tool to generaet a new Rust project
  ];
}
