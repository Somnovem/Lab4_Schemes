library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_tx_digis_ram8x49_syn is
    generic(
        read_access_time: integer := 0;
        write_access_time: integer := 0;
        ram_width       : integer := 54
    );
    port(
        data_in         : in     vl_logic_vector(53 downto 0);
        clk             : in     vl_logic;
        fifo_wr         : in     vl_logic_vector(7 downto 0);
        rst_l           : in     vl_logic;
        fifo_re         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(53 downto 0)
    );
end hardcopyiv_hssi_tx_digis_ram8x49_syn;
