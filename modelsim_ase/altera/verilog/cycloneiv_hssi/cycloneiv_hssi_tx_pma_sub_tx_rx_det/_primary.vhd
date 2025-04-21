library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_tx_pma_sub_tx_rx_det is
    generic(
        \RX_EXIST\      : integer := 1
    );
    port(
        rx_det_pdb      : in     vl_logic;
        clk15m          : in     vl_logic;
        tx_det_rx       : in     vl_logic;
        rx_found        : out    vl_logic;
        rx_det_valid    : out    vl_logic
    );
end cycloneiv_hssi_tx_pma_sub_tx_rx_det;
