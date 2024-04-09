{ pkgs, ... }: {
  home.packages = with pkgs; [
    ghdl # vhdl simulator
    verilog # icarus Verilog compiler 
    gtkwave # VCD/Waveform viewer
    yosys # synthesis
    nextpnr # place and route
    openfpgaloader # flashing 
    python311Packages.apycula # Gowin FPGAs
  ];
}
