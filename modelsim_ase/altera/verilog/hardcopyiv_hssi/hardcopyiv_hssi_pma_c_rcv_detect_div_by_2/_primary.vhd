library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_pma_c_rcv_detect_div_by_2 is
    port(
        \CLK\           : in     vl_logic;
        \RESET_N\       : in     vl_logic;
        \CLKOUT\        : out    vl_logic
    );
end hardcopyiv_hssi_pma_c_rcv_detect_div_by_2;
