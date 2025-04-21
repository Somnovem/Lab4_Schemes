library verilog;
use verilog.vl_types.all;
entity stratixiv_hssi_aux_clock_mult is
    generic(
        clk_multiply_by : integer := 1;
        pfd_fb_select   : string  := "internal"
    );
    port(
        clk             : in     vl_logic;
        fbclk           : in     vl_logic;
        adjust          : in     vl_logic;
        adjust_without_lol: in     vl_logic;
        reset           : in     vl_logic;
        enable_m        : in     vl_logic;
        m               : in     vl_logic_vector(7 downto 0);
        clkout          : out    vl_logic_vector(3 downto 0);
        busy            : out    vl_logic_vector(1 downto 0)
    );
end stratixiv_hssi_aux_clock_mult;
