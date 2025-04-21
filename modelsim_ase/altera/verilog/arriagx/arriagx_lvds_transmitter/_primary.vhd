library verilog;
use verilog.vl_types.all;
entity arriagx_lvds_transmitter is
    generic(
        bypass_serializer: string  := "false";
        invert_clock    : string  := "false";
        use_falling_clock_edge: string  := "false";
        use_serial_data_input: string  := "false";
        use_post_dpa_serial_data_input: string  := "false";
        preemphasis_setting: integer := 0;
        vod_setting     : integer := 0;
        differential_drive: integer := 0;
        lpm_type        : string  := "arriagx_lvds_transmitter";
        channel_width   : integer := 10
    );
    port(
        clk0            : in     vl_logic;
        enable0         : in     vl_logic;
        datain          : in     vl_logic_vector;
        serialdatain    : in     vl_logic;
        postdpaserialdatain: in     vl_logic;
        dataout         : out    vl_logic;
        serialfdbkout   : out    vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic
    );
end arriagx_lvds_transmitter;
