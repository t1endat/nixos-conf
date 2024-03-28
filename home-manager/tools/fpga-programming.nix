{ pkgs, ... }: {
  home.packages = with pkgs; [
    # yosys # fpga synthesis
    # nextpnr # fpga place and route
    # openfpgaloader # fpga programming
    quartus-prime-lite
  ];
}
