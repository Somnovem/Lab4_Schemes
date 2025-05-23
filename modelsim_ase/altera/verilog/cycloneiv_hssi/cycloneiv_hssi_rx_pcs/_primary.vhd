library verilog;
use verilog.vl_types.all;
entity cycloneiv_hssi_rx_pcs is
    generic(
        lpm_type        : string  := "cycloneiv_hssi_rx_pcs";
        align_ordered_set_based: string  := "false";
        align_pattern   : string  := "";
        align_pattern_length: integer := 7;
        allow_align_polarity_inversion: string  := "false";
        allow_pipe_polarity_inversion: string  := "false";
        bit_slip_enable : string  := "false";
        byte_order_back_compat_enable: string  := "false";
        byte_order_invalid_code_or_run_disp_error: string  := "false";
        byte_order_mode : string  := "none";
        byte_order_pad_pattern: string  := "";
        byte_order_pattern: string  := "";
        byte_order_pld_ctrl_enable: string  := "false";
        cdrctrl_bypass_ppm_detector_cycle: integer := 0;
        cdrctrl_cid_mode_enable: string  := "false";
        cdrctrl_enable  : string  := "false";
        cdrctrl_mask_cycle: integer := 0;
        cdrctrl_min_lock_to_ref_cycle: integer := 0;
        cdrctrl_rxvalid_mask: string  := "false";
        channel_bonding : string  := "none";
        channel_number  : integer := 0;
        channel_width   : integer := 8;
        clk1_mux_select : string  := "recovered clock";
        clk2_mux_select : string  := "recovered clock";
        datapath_low_latency_mode: string  := "false";
        datapath_protocol: string  := "basic";
        dec_8b_10b_compatibility_mode: string  := "false";
        dec_8b_10b_mode : string  := "none";
        disable_auto_idle_insertion: string  := "false";
        disable_running_disp_in_word_align: string  := "false";
        disallow_kchar_after_pattern_ordered_set: string  := "false";
        elec_idle_eios_detect_priority_over_eidle_disable: string  := "false";
        elec_idle_gen1_sigdet_enable: string  := "false";
        elec_idle_infer_enable: string  := "false";
        elec_idle_num_com_detect: integer := 0;
        enable_bit_reversal: string  := "false";
        enable_self_test_mode: string  := "false";
        error_from_wa_or_8b_10b_select: string  := "false";
        force_signal_detect_dig: string  := "false";
        hip_enable      : string  := "false";
        infiniband_invalid_code: integer := 0;
        insert_pad_on_underflow: string  := "false";
        logical_channel_address: integer := 0;
        num_align_code_groups_in_ordered_set: integer := 0;
        num_align_cons_good_data: integer := 1;
        num_align_cons_pat: integer := 1;
        num_align_loss_sync_error: integer := 1;
        ph_fifo_low_latency_enable: string  := "false";
        ph_fifo_reg_mode: string  := "false";
        ph_fifo_reset_enable: string  := "false";
        ph_fifo_user_ctrl_enable: string  := "false";
        phystatus_delay : integer := 0;
        phystatus_reset_toggle: string  := "false";
        prbs_all_one_detect: string  := "false";
        prbs_cid_pattern: string  := "false";
        prbs_cid_pattern_length: integer := 0;
        protocol_hint   : string  := "basic";
        rate_match_back_to_back: string  := "false";
        rate_match_delete_threshold: integer := 0;
        rate_match_empty_threshold: integer := 0;
        rate_match_fifo_mode: string  := "false";
        rate_match_full_threshold: integer := 0;
        rate_match_insert_threshold: integer := 0;
        rate_match_ordered_set_based: string  := "false";
        rate_match_pattern1: string  := "";
        rate_match_pattern2: string  := "";
        rate_match_pattern_size: integer := 10;
        rate_match_pipe_enable: string  := "false";
        rate_match_reset_enable: string  := "false";
        rate_match_skip_set_based: string  := "false";
        rate_match_start_threshold: integer := 0;
        rd_clk_mux_select: string  := "int clock";
        recovered_clk_mux_select: string  := "recovered clock";
        reset_clock_output_during_digital_reset: string  := "false";
        run_length      : integer := 4;
        run_length_enable: string  := "false";
        rx_detect_bypass: string  := "false";
        rxstatus_error_report_mode: integer := 0;
        self_test_mode  : string  := "prbs7";
        test_bus_sel    : integer := 0;
        use_alignment_state_machine: string  := "false";
        use_double_data_mode: string  := "false";
        use_parallel_loopback: string  := "false"
    );
    port(
        a1a2size        : in     vl_logic;
        bitslip         : in     vl_logic;
        cdrctrllocktorefcl: in     vl_logic;
        coreclk         : in     vl_logic;
        datain          : in     vl_logic_vector(9 downto 0);
        digitalreset    : in     vl_logic;
        elecidleinfersel: in     vl_logic_vector(2 downto 0);
        enabyteord      : in     vl_logic;
        enapatternalign : in     vl_logic;
        grayelecidleinferselfromtx: in     vl_logic_vector(2 downto 0);
        hip8b10binvpolarity: in     vl_logic;
        hipelecidleinfersel: in     vl_logic_vector(2 downto 0);
        hippowerdown    : in     vl_logic_vector(1 downto 0);
        invpol          : in     vl_logic;
        localrefclk     : in     vl_logic;
        parallelfdbk    : in     vl_logic_vector(19 downto 0);
        phfifordenable  : in     vl_logic;
        phfiforeset     : in     vl_logic;
        phfifowrdisable : in     vl_logic;
        phfifox4bytesel : in     vl_logic;
        phfifox4rdenable: in     vl_logic;
        phfifox4wrclk   : in     vl_logic;
        phfifox4wrenable: in     vl_logic;
        pipe8b10binvpolarity: in     vl_logic;
        pipeenrevparallellpbkfromtx: in     vl_logic;
        pipepowerdown   : in     vl_logic_vector(1 downto 0);
        pipepowerstate  : in     vl_logic_vector(3 downto 0);
        pmatestbusin    : in     vl_logic_vector(7 downto 0);
        powerdn         : in     vl_logic_vector(1 downto 0);
        prbscidenable   : in     vl_logic;
        quadreset       : in     vl_logic;
        recoveredclk    : in     vl_logic;
        refclk          : in     vl_logic;
        revbitorderwa   : in     vl_logic;
        rmfifordena     : in     vl_logic;
        rmfiforeset     : in     vl_logic;
        rmfifowrena     : in     vl_logic;
        rxdetectvalid   : in     vl_logic;
        rxfound         : in     vl_logic_vector(1 downto 0);
        signaldetected  : in     vl_logic;
        wareset         : in     vl_logic;
        a1a2sizeout     : out    vl_logic_vector(1 downto 0);
        a1detect        : out    vl_logic;
        a2detect        : out    vl_logic;
        bistdone        : out    vl_logic;
        bisterr         : out    vl_logic;
        bitslipboundaryselectout: out    vl_logic_vector(4 downto 0);
        byteorderalignstatus: out    vl_logic;
        cdrctrlearlyeios: out    vl_logic;
        cdrctrllocktorefclkout: out    vl_logic;
        clkout          : out    vl_logic;
        coreclkout      : out    vl_logic;
        ctrldetect      : out    vl_logic_vector(1 downto 0);
        dataout         : out    vl_logic_vector(19 downto 0);
        dataoutfull     : out    vl_logic_vector(31 downto 0);
        disperr         : out    vl_logic_vector(1 downto 0);
        errdetect       : out    vl_logic_vector(1 downto 0);
        hipdataout      : out    vl_logic_vector(8 downto 0);
        hipdatavalid    : out    vl_logic;
        hipelecidle     : out    vl_logic;
        hipphydonestatus: out    vl_logic;
        hipstatus       : out    vl_logic_vector(2 downto 0);
        k1detect        : out    vl_logic;
        k2detect        : out    vl_logic;
        patterndetect   : out    vl_logic_vector(1 downto 0);
        phfifooverflow  : out    vl_logic;
        phfifordenableout: out    vl_logic;
        phfiforesetout  : out    vl_logic;
        phfifounderflow : out    vl_logic;
        phfifowrdisableout: out    vl_logic;
        pipebufferstat  : out    vl_logic_vector(3 downto 0);
        pipedatavalid   : out    vl_logic;
        pipeelecidle    : out    vl_logic;
        pipephydonestatus: out    vl_logic;
        pipestatus      : out    vl_logic_vector(2 downto 0);
        revparallelfdbkdata: out    vl_logic_vector(19 downto 0);
        rlv             : out    vl_logic;
        rmfifodatadeleted: out    vl_logic_vector(1 downto 0);
        rmfifodatainserted: out    vl_logic_vector(1 downto 0);
        rmfifoempty     : out    vl_logic;
        rmfifofull      : out    vl_logic;
        runningdisp     : out    vl_logic_vector(1 downto 0);
        signaldetect    : out    vl_logic;
        syncstatus      : out    vl_logic_vector(1 downto 0)
    );
end cycloneiv_hssi_rx_pcs;
