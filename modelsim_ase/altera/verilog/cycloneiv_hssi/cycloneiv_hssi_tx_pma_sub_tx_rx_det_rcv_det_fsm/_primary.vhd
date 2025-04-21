library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_tx_pma_sub_tx_rx_det_rcv_det_fsm is
    generic(
        \RESET\         : integer := 0;
        \WAKE\          : integer := 1;
        \STATE_1\       : integer := 3;
        \STATE_2\       : integer := 5;
        \HOLD\          : integer := 4
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        com_pass        : in     vl_logic;
        probe_pass      : in     vl_logic;
        det_on          : out    vl_logic;
        detect_valid    : out    vl_logic;
        rcv_found       : out    vl_logic
    );
end cycloneiv_hssi_tx_pma_sub_tx_rx_det_rcv_det_fsm;
