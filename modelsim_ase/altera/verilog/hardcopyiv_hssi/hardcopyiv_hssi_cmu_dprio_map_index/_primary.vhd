library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_cmu_dprio_map_index is
    generic(
        clkdiv0_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv0_inclk1_logical_to_physical_mapping: string  := "pll1";
        clkdiv1_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv1_inclk1_logical_to_physical_mapping: string  := "pll1";
        clkdiv2_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv2_inclk1_logical_to_physical_mapping: string  := "pll1";
        clkdiv3_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv3_inclk1_logical_to_physical_mapping: string  := "pll1";
        clkdiv4_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv4_inclk1_logical_to_physical_mapping: string  := "pll1";
        clkdiv5_inclk0_logical_to_physical_mapping: string  := "pll0";
        clkdiv5_inclk1_logical_to_physical_mapping: string  := "pll1";
        pll0_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll0_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll0_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll0_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll0_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll0_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll0_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll0_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll0_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll0_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll1_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll1_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll1_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll1_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll1_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll1_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll1_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll1_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll1_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll1_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll2_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll2_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll2_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll2_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll2_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll2_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll2_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll2_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll2_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll2_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll3_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll3_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll3_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll3_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll3_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll3_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll3_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll3_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll3_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll3_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll4_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll4_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll4_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll4_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll4_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll4_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll4_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll4_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll4_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll4_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll5_inclk0_logical_to_physical_mapping: string  := "clkrefclk0";
        pll5_inclk1_logical_to_physical_mapping: string  := "clkrefclk1";
        pll5_inclk2_logical_to_physical_mapping: string  := "iq2";
        pll5_inclk3_logical_to_physical_mapping: string  := "iq3";
        pll5_inclk4_logical_to_physical_mapping: string  := "iq4";
        pll5_inclk5_logical_to_physical_mapping: string  := "iq5";
        pll5_inclk6_logical_to_physical_mapping: string  := "iq6";
        pll5_inclk7_logical_to_physical_mapping: string  := "iq7";
        pll5_inclk8_logical_to_physical_mapping: string  := "pld_clk";
        pll5_inclk9_logical_to_physical_mapping: string  := "gpll_clk";
        pll0_logical_to_physical_mapping: integer := 0;
        pll1_logical_to_physical_mapping: integer := 1;
        pll2_logical_to_physical_mapping: integer := 2;
        pll3_logical_to_physical_mapping: integer := 3;
        pll4_logical_to_physical_mapping: integer := 4;
        pll5_logical_to_physical_mapping: integer := 5;
        refclk_divider0_logical_to_physical_mapping: integer := 0;
        refclk_divider1_logical_to_physical_mapping: integer := 1;
        rx0_logical_to_physical_mapping: integer := 0;
        rx1_logical_to_physical_mapping: integer := 1;
        rx2_logical_to_physical_mapping: integer := 2;
        rx3_logical_to_physical_mapping: integer := 3;
        rx4_logical_to_physical_mapping: integer := 4;
        rx5_logical_to_physical_mapping: integer := 5;
        tx0_logical_to_physical_mapping: integer := 0;
        tx1_logical_to_physical_mapping: integer := 1;
        tx2_logical_to_physical_mapping: integer := 2;
        tx3_logical_to_physical_mapping: integer := 3;
        tx4_logical_to_physical_mapping: integer := 4;
        tx5_logical_to_physical_mapping: integer := 5;
        tx0_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx0_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx0_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx0_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx0_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport";
        tx1_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx1_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx1_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx1_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx1_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport";
        tx2_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx2_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx2_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx2_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx2_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport";
        tx3_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx3_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx3_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx3_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx3_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport";
        tx4_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx4_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx4_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx4_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx4_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport";
        tx5_pma_inclk0_logical_to_physical_mapping: string  := "x1";
        tx5_pma_inclk1_logical_to_physical_mapping: string  := "x4";
        tx5_pma_inclk2_logical_to_physical_mapping: string  := "xn_top";
        tx5_pma_inclk3_logical_to_physical_mapping: string  := "xn_bottom";
        tx5_pma_inclk4_logical_to_physical_mapping: string  := "hypertransport"
    );
    port(
        pll0_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll0_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll0_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll0_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll0_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll0_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        pll1_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll1_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll1_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll1_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll1_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll1_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        pll2_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll2_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll2_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll2_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll2_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll2_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        pll3_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll3_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll3_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll3_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll3_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll3_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        pll4_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll4_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll4_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll4_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll4_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll4_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        pll5_init_pfd_clk_sel: in     vl_logic_vector(3 downto 0);
        pll5_dp_riqclk_sel: in     vl_logic_vector(1 downto 0);
        pll5_dp_rrefclk_sel: in     vl_logic_vector(1 downto 0);
        pll5_csr_riqclk_sel: out    vl_logic_vector(1 downto 0);
        pll5_csr_rrefclk_sel: out    vl_logic_vector(1 downto 0);
        pll5_dp_pfd_clk_sel: out    vl_logic_vector(3 downto 0);
        txpma0_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma0_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma0_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma0_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        txpma1_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma1_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma1_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma1_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        txpma2_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma2_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma2_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma2_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        txpma3_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma3_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma3_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma3_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        txpma4_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma4_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma4_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma4_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        txpma5_init_clkin_sel: in     vl_logic_vector(2 downto 0);
        txpma5_csr_rcgb_x_en: out    vl_logic_vector(1 downto 0);
        txpma5_dp_rcgb_x_en: in     vl_logic_vector(1 downto 0);
        txpma5_dp_clkin_sel: out    vl_logic_vector(2 downto 0);
        clkdiv0_init_inclk_select: in     vl_logic;
        clkdiv0_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv0_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv0_dp_inclk_select: out    vl_logic;
        clkdiv1_init_inclk_select: in     vl_logic;
        clkdiv1_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv1_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv1_dp_inclk_select: out    vl_logic;
        clkdiv2_init_inclk_select: in     vl_logic;
        clkdiv2_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv2_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv2_dp_inclk_select: out    vl_logic;
        clkdiv3_init_inclk_select: in     vl_logic;
        clkdiv3_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv3_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv3_dp_inclk_select: out    vl_logic;
        clkdiv4_init_inclk_select: in     vl_logic;
        clkdiv4_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv4_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv4_dp_inclk_select: out    vl_logic;
        clkdiv5_init_inclk_select: in     vl_logic;
        clkdiv5_csr_rcgb_cmu_sel: out    vl_logic;
        clkdiv5_dp_rcgb_cmu_sel: in     vl_logic;
        clkdiv5_dp_inclk_select: out    vl_logic
    );
end hardcopyiv_hssi_cmu_dprio_map_index;
