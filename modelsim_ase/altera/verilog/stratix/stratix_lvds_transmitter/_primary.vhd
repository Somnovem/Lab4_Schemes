library verilog;
use verilog.vl_types.all;
entity stratix_lvds_transmitter is
    generic(
        bypass_serializer: string  := "false";
        invert_clock    : string  := "false";
        use_falling_clock_edge: string  := "false";
        lpm_type        : string  := "stratix_lvds_transmitter";
        channel_width   : integer := 4
    );
    port(
        clk0            : in     vl_logic;
        enable0         : in     vl_logic;
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic
    );
end stratix_lvds_transmitter;
