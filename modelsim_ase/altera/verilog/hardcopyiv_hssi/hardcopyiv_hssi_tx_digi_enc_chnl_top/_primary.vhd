library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_tx_digi_enc_chnl_top is
    port(
        cascaded_8b10b_en: in     vl_logic;
        clk             : in     vl_logic;
        d21_5_eq_n      : in     vl_logic;
        d2_2_eq_n       : in     vl_logic;
        disp_out_3b     : out    vl_logic_vector(1 downto 0);
        doublewidth     : in     vl_logic;
        dwidth          : in     vl_logic;
        endec           : in     vl_logic;
        enpolinv_tx     : in     vl_logic;
        ge_xaui_sel     : in     vl_logic;
        ib_force_disparity: in     vl_logic;
        k_det           : in     vl_logic;
        prbs_en         : in     vl_logic;
        pudr            : out    vl_logic_vector(19 downto 0);
        r8b10b_enc_ibm_en: in     vl_logic;
        renbitrev_tx    : in     vl_logic;
        rendec_data_sel_tx: in     vl_logic;
        renpolinv_tx    : in     vl_logic;
        rensymswap_tx   : in     vl_logic;
        rev_loop_data   : in     vl_logic_vector(19 downto 0);
        rev_loopbk      : in     vl_logic;
        rforce_disp     : in     vl_logic;
        rrev_loopbk     : in     vl_logic;
        rst             : in     vl_logic;
        rtxbitslip_en   : in     vl_logic;
        tx_boundary_sel : in     vl_logic_vector(4 downto 0);
        tx_ctl_pre_en   : out    vl_logic_vector(1 downto 0);
        tx_ctl_tc       : in     vl_logic_vector(1 downto 0);
        tx_ctl_ts       : in     vl_logic;
        tx_data_9_pre_en: out    vl_logic_vector(1 downto 0);
        tx_data_9_tc    : in     vl_logic_vector(1 downto 0);
        tx_data_pg      : in     vl_logic_vector(19 downto 0);
        tx_data_pre_en  : out    vl_logic_vector(15 downto 0);
        tx_data_tc      : in     vl_logic_vector(15 downto 0);
        tx_data_ts      : in     vl_logic_vector(7 downto 0);
        txd_extend_tc   : in     vl_logic_vector(1 downto 0);
        txlp20b         : out    vl_logic_vector(19 downto 0)
    );
end hardcopyiv_hssi_tx_digi_enc_chnl_top;
