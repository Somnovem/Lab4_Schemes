library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_pma_c_clkgendrv is
    port(
        clk0            : in     vl_logic;
        clk90           : in     vl_logic;
        clk180          : in     vl_logic;
        clk270          : in     vl_logic;
        cpulse          : out    vl_logic;
        cpulseb         : out    vl_logic;
        cpulseo         : out    vl_logic;
        div5            : in     vl_logic;
        hfclk_n         : out    vl_logic;
        hfclk_p         : out    vl_logic;
        lfclk_n         : out    vl_logic;
        lfclk_p         : out    vl_logic;
        rst_n           : in     vl_logic;
        vccelxqyx       : in     vl_logic;
        vssexqyx        : in     vl_logic
    );
end hardcopyiv_hssi_pma_c_clkgendrv;
