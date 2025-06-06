library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_pma_c_clkgenbuf_tx10g is
    port(
        clk0_in         : in     vl_logic;
        clk180_in       : in     vl_logic;
        cpulse          : out    vl_logic;
        cpulseb         : out    vl_logic;
        hfclk_n         : out    vl_logic;
        hfclk_p         : out    vl_logic;
        lfclk_n         : out    vl_logic;
        lfclk_p         : out    vl_logic;
        rst_n           : in     vl_logic;
        vccelxqyx       : in     vl_logic;
        vssexqyx        : in     vl_logic
    );
end hardcopyiv_hssi_pma_c_clkgenbuf_tx10g;
