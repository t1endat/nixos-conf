{ pkgs, ... }: {
  home.packages = with pkgs; [
    ghdl # vhdl simulator
    verilog # icarus Verilog compiler 
    gtkwave # VCD/Waveform viewer
    yosys # fpga synthesis
    nextpnr # fpga place and route
    openfpgaloader # fpga programming
    python311Packages.apycula # Gowin FPGAs
  ];
}
