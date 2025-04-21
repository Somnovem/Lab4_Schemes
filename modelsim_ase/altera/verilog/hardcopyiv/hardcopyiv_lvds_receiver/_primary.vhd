library verilog;
use verilog.vl_types.all;
entity hardcopyiv_lvds_receiver is
    generic(
        data_align_rollover: integer := 2;
        enable_dpa      : string  := "off";
        lose_lock_on_one_change: string  := "off";
        reset_fifo_at_first_lock: string  := "on";
        align_to_rising_edge_only: string  := "on";
        use_serial_feedback_input: string  := "off";
        dpa_debug       : string  := "off";
        x_on_bitslip    : string  := "on";
        enable_soft_cdr : string  := "off";
        dpa_output_clock_phase_shift: integer := 0;
        enable_dpa_initial_phase_selection: string  := "off";
        dpa_initial_phase_value: integer := 0;
        enable_dpa_align_to_rising_edge_only: string  := "off";
        net_ppm_variation: integer := 0;
        is_negative_ppm_drift: string  := "off";
        rx_input_path_delay_engineering_bits: integer := 2;
        lpm_type        : string  := "hardcopyiv_lvds_receiver";
        channel_width   : integer := 10
    );
    port(
        clk0            : in     vl_logic;
        datain          : in     vl_logic;
        enable0         : in     vl_logic;
        dpareset        : in     vl_logic;
        dpahold         : in     vl_logic;
        dpaswitch       : in     vl_logic;
        fiforeset       : in     vl_logic;
        bitslip         : in     vl_logic;
        bitslipreset    : in     vl_logic;
        serialfbk       : in     vl_logic;
        dataout         : out    vl_logic_vector;
        dpalock         : out    vl_logic;
        bitslipmax      : out    vl_logic;
        serialdataout   : out    vl_logic;
        postdpaserialdataout: out    vl_logic;
        divfwdclk       : out    vl_logic;
        dpaclkout       : out    vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic
    );
end hardcopyiv_lvds_receiver;
