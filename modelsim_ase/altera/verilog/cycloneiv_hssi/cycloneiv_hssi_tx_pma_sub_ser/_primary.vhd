library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_tx_pma_sub_ser is
    generic(
        channel_width   : integer := 8;
        bypass_serializer: string  := "false";
        invert_clock    : string  := "false";
        use_falling_clock_edge: string  := "false";
        use_serial_data_input: string  := "false";
        use_post_dpa_serial_data_input: string  := "false";
        is_used_as_outclk: string  := "false";
        tx_output_path_delay_engineering_bits: integer := -1;
        enable_dpaclk_to_lvdsout: string  := "off";
        preemphasis_setting: integer := 0;
        vod_setting     : integer := 0;
        differential_drive: integer := 0;
        lpm_type        : string  := "cycloneiv_hssi_tx_pma_sub_ser"
    );
    port(
        datain          : in     vl_logic_vector(9 downto 0);
        clk0            : in     vl_logic;
        cgb_pdb         : in     vl_logic;
        enable0         : in     vl_logic;
        serialdatain    : in     vl_logic;
        postdpaserialdatain: in     vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic;
        dpaclkin        : in     vl_logic;
        dataout         : out    vl_logic;
        serialfdbkout   : out    vl_logic
    );
end cycloneiv_hssi_tx_pma_sub_ser;
