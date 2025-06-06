library verilog;
use verilog.vl_types.all;
entity cycloneiv_jtag is
    generic(
        lpm_type        : string  := "cycloneiv_jtag"
    );
    port(
        tms             : in     vl_logic;
        tck             : in     vl_logic;
        tdi             : in     vl_logic;
        tdoutap         : in     vl_logic;
        tdouser         : in     vl_logic;
        tdo             : out    vl_logic;
        tmsutap         : out    vl_logic;
        tckutap         : out    vl_logic;
        tdiutap         : out    vl_logic;
        shiftuser       : out    vl_logic;
        clkdruser       : out    vl_logic;
        updateuser      : out    vl_logic;
        runidleuser     : out    vl_logic;
        usr1user        : out    vl_logic
    );
end cycloneiv_jtag;
