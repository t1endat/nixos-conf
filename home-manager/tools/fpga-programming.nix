{ pkgs, ... }: {
  home.packages = with pkgs; [
    # ghdl # vhdl simulator
    # yosys # fpga synthesis
    # nextpnr # fpga place and route
    # openfpgaloader # fpga programming
    quartus-prime-lite
  ];
}
