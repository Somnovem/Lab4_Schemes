library verilog;
use verilog.vl_types.all;
entity \MF_cycloneiiigl_n_cntr\ is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        cout            : out    vl_logic;
        modulus         : in     vl_logic_vector(31 downto 0)
    );
end \MF_cycloneiiigl_n_cntr\;
