library verilog;
use verilog.vl_types.all;
entity arriaii_hssi_calibration_block is
    generic(
        lpm_type        : string  := "arriaii_hssi_calibration_block";
        cont_cal_mode   : string  := "false";
        enable_rx_cal_tw: string  := "false";
        enable_tx_cal_tw: string  := "false";
        rtest           : string  := "false";
        rx_cal_wt_value : integer := 0;
        send_rx_cal_status: string  := "false";
        tx_cal_wt_value : integer := 1;
        migrated_from_prev_family: string  := "false"
    );
    port(
        clk             : in     vl_logic;
        enabletestbus   : in     vl_logic;
        powerdn         : in     vl_logic;
        testctrl        : in     vl_logic;
        calibrationstatus: out    vl_logic_vector(4 downto 0);
        nonusertocmu    : out    vl_logic
    );
end arriaii_hssi_calibration_block;
