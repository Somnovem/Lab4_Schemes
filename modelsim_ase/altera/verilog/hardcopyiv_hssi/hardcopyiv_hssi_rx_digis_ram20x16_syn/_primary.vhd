library verilog;
use verilog.vl_types.all;
entity hardcopyiv_hssi_rx_digis_ram20x16_syn is
    generic(
        read_access_time: integer := 0;
        write_access_time: integer := 0;
        ram_width       : integer := 16
    );
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        fifo_wr         : in     vl_logic_vector(19 downto 0);
        rst_l           : in     vl_logic;
        fifo_re1        : in     vl_logic_vector(19 downto 0);
        fifo_re2        : in     vl_logic_vector(19 downto 0);
        data_out1       : out    vl_logic_vector(15 downto 0);
        data_out2       : out    vl_logic_vector(15 downto 0)
    );
end hardcopyiv_hssi_rx_digis_ram20x16_syn;
