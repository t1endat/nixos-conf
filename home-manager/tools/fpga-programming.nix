{ pkgs, ... }: {
  home.packages = with pkgs; [
    ghdl # vhdl simulator
    verilog # icarus Verilog compiler 
    gtkwave # VCD/Waveform viewer
    yosys # fpga synthesis
    nextpnr # fpga place and route
    openfpgaloader # fpga programming
    # icestorm # Lattice iCE40 FPGAs
    # trellis # Lattice ECP5 FPGAs
  ];
}
