library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_rx_pma_sub_clkdiv is
    generic(
        channel_width   : integer := 8
    );
    port(
        rxfclk          : in     vl_logic;
        clr             : in     vl_logic;
        loaden          : out    vl_logic;
        clkdivrx        : out    vl_logic
    );
end cycloneiv_hssi_rx_pma_sub_clkdiv;
