library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_tx_pma is
    generic(
        lpm_type        : string  := "cycloneiv_hssi_tx_pma";
        channel_number  : integer := 0;
        common_mode     : string  := "0.65V";
        enable_diagnostic_loopback: string  := "false";
        enable_reverse_serial_loopback: string  := "false";
        enable_txclkout_loopback: string  := "false";
        preemp_tap_1    : integer := 0;
        protocol_hint   : string  := "basic";
        rx_detect       : integer := 0;
        serialization_factor: integer := 8;
        slew_rate       : string  := "low";
        termination     : string  := "OCT 100 Ohms";
        use_external_termination: string  := "false";
        use_rx_detect   : string  := "false";
        vod_selection   : integer := 0
    );
    port(
        cgbpowerdn      : in     vl_logic;
        datain          : in     vl_logic_vector(9 downto 0);
        detectrxpowerdown: in     vl_logic;
        diagnosticlpbkin: in     vl_logic;
        fastrefclk0in   : in     vl_logic;
        forceelecidle   : in     vl_logic;
        powerdn         : in     vl_logic;
        refclk0in       : in     vl_logic;
        refclk0inpulse  : in     vl_logic;
        reverselpbkin   : in     vl_logic;
        rxdetectclk     : in     vl_logic;
        rxdetecten      : in     vl_logic;
        txpmareset      : in     vl_logic;
        clockout        : out    vl_logic;
        dataout         : out    vl_logic;
        rxdetectvalidout: out    vl_logic;
        rxfoundout      : out    vl_logic;
        seriallpbkout   : out    vl_logic
    );
end cycloneiv_hssi_tx_pma;
