library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_rx_pma is
    generic(
        lpm_type        : string  := "cycloneiv_hssi_rx_pma";
        allow_serial_loopback: string  := "false";
        channel_number  : integer := 0;
        common_mode     : string  := "0.82V";
        deserialization_factor: integer := 8;
        enable_dpa_shift: string  := "false";
        enable_initial_phase_selection: string  := "false";
        enable_pd_counter_accumulate_mode: string  := "false";
        eq_dc_gain      : integer := 0;
        eq_setting      : integer := 1;
        force_signal_detect: string  := "true";
        initial_phase_value: integer := 0;
        pd1_counter_setting: integer := 5;
        pd2_counter_setting: integer := 5;
        pd_rising_edge_only: string  := "false";
        phase_step_add_setting: integer := 2;
        phase_step_sub_setting: integer := 1;
        ppmselect       : integer := 0;
        protocol_hint   : string  := "basic";
        send_reverse_serial_loopback_data: string  := "false";
        send_reverse_serial_loopback_recovered_clk: string  := "false";
        signal_detect_hysteresis: integer := 4;
        signal_detect_hysteresis_valid_threshold: integer := 1;
        signal_detect_loss_threshold: integer := 1;
        termination     : string  := "OCT 100 Ohms";
        use_external_termination: string  := "false"
    );
    port(
        crupowerdn      : in     vl_logic;
        datain          : in     vl_logic;
        deserclock      : in     vl_logic;
        dpashift        : in     vl_logic;
        locktodata      : in     vl_logic;
        locktoref       : in     vl_logic;
        powerdn         : in     vl_logic;
        ppmdetectrefclk : in     vl_logic;
        rxpmareset      : in     vl_logic;
        seriallpbkin    : in     vl_logic;
        testbussel      : in     vl_logic_vector(3 downto 0);
        analogtestbus   : out    vl_logic_vector(7 downto 0);
        clockout        : out    vl_logic;
        datastrobeout   : out    vl_logic;
        diagnosticlpbkout: out    vl_logic;
        freqlocked      : out    vl_logic;
        locktorefout    : out    vl_logic;
        recoverdataout  : out    vl_logic_vector(9 downto 0);
        reverselpbkout  : out    vl_logic;
        signaldetect    : out    vl_logic
    );
end cycloneiv_hssi_rx_pma;
