library verilog;
use verilog.vl_types.all;
entity cycloneiv_clkctrl is
    generic(
        clock_type      : string  := "auto";
        ena_register_mode: string  := "falling edge";
        lpm_type        : string  := "cycloneiv_clkctrl"
    );
    port(
        inclk           : in     vl_logic_vector(3 downto 0);
        clkselect       : in     vl_logic_vector(1 downto 0);
        ena             : in     vl_logic;
        devpor          : in     vl_logic;
        devclrn         : in     vl_logic;
        outclk          : out    vl_logic
    );
end cycloneiv_clkctrl;
