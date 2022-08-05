-- VHDL Entity alien_game_lib.c5_t1_8_bit_comparator.symbol
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 16:09:13 11/10/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t1_8_bit_comparator IS
   PORT( 
      a_in  : IN     std_logic_vector (7 DOWNTO 0);
      b_in  : IN     std_logic_vector (7 DOWNTO 0);
      r_out : OUT    std_logic
   );

-- Declarations

END c5_t1_8_bit_comparator ;

--
-- VHDL Architecture alien_game_lib.c5_t1_8_bit_comparator.struct
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 16:09:13 11/10/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c5_t1_8_bit_comparator IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din1   : std_logic;
   SIGNAL din2   : std_logic;
   SIGNAL din3   : std_logic;
   SIGNAL din4   : std_logic;
   SIGNAL din5   : std_logic;
   SIGNAL din6   : std_logic;
   SIGNAL din7   : std_logic;
   SIGNAL dout   : std_logic;
   SIGNAL dout1  : std_logic;
   SIGNAL dout10 : std_logic;
   SIGNAL dout11 : std_logic;
   SIGNAL dout12 : std_logic;
   SIGNAL dout13 : std_logic;
   SIGNAL dout14 : std_logic;
   SIGNAL dout15 : std_logic;
   SIGNAL dout16 : std_logic;
   SIGNAL dout2  : std_logic;
   SIGNAL dout3  : std_logic;
   SIGNAL dout4  : std_logic;
   SIGNAL dout5  : std_logic;
   SIGNAL dout6  : std_logic;
   SIGNAL dout7  : std_logic;
   SIGNAL dout8  : std_logic;
   SIGNAL dout9  : std_logic;



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_24' of 'and'
   r_out <= dout16 AND din1 AND din2 AND din3 AND din4 AND din5 AND din6
            AND din7;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'inv'
   dout <= NOT(a_in(0));

   -- ModuleWare code(v1.12) for instance 'U_1' of 'inv'
   dout2 <= NOT(a_in(1));

   -- ModuleWare code(v1.12) for instance 'U_2' of 'inv'
   dout4 <= NOT(a_in(2));

   -- ModuleWare code(v1.12) for instance 'U_3' of 'inv'
   dout6 <= NOT(a_in(3));

   -- ModuleWare code(v1.12) for instance 'U_4' of 'inv'
   dout8 <= NOT(a_in(4));

   -- ModuleWare code(v1.12) for instance 'U_5' of 'inv'
   dout10 <= NOT(a_in(5));

   -- ModuleWare code(v1.12) for instance 'U_6' of 'inv'
   dout12 <= NOT(a_in(6));

   -- ModuleWare code(v1.12) for instance 'U_7' of 'inv'
   dout14 <= NOT(a_in(7));

   -- ModuleWare code(v1.12) for instance 'U_8' of 'inv'
   dout1 <= NOT(b_in(0));

   -- ModuleWare code(v1.12) for instance 'U_9' of 'inv'
   dout3 <= NOT(b_in(1));

   -- ModuleWare code(v1.12) for instance 'U_10' of 'inv'
   dout5 <= NOT(b_in(2));

   -- ModuleWare code(v1.12) for instance 'U_11' of 'inv'
   dout7 <= NOT(b_in(3));

   -- ModuleWare code(v1.12) for instance 'U_12' of 'inv'
   dout9 <= NOT(b_in(4));

   -- ModuleWare code(v1.12) for instance 'U_13' of 'inv'
   dout11 <= NOT(b_in(5));

   -- ModuleWare code(v1.12) for instance 'U_14' of 'inv'
   dout13 <= NOT(b_in(6));

   -- ModuleWare code(v1.12) for instance 'U_15' of 'inv'
   dout15 <= NOT(b_in(7));

   -- ModuleWare code(v1.12) for instance 'U_16' of 'xnor'
   dout16 <= NOT(dout XOR dout1);

   -- ModuleWare code(v1.12) for instance 'U_17' of 'xnor'
   din1 <= NOT(dout2 XOR dout3);

   -- ModuleWare code(v1.12) for instance 'U_18' of 'xnor'
   din2 <= NOT(dout4 XOR dout5);

   -- ModuleWare code(v1.12) for instance 'U_19' of 'xnor'
   din3 <= NOT(dout6 XOR dout7);

   -- ModuleWare code(v1.12) for instance 'U_20' of 'xnor'
   din4 <= NOT(dout8 XOR dout9);

   -- ModuleWare code(v1.12) for instance 'U_21' of 'xnor'
   din5 <= NOT(dout10 XOR dout11);

   -- ModuleWare code(v1.12) for instance 'U_22' of 'xnor'
   din6 <= NOT(dout12 XOR dout13);

   -- ModuleWare code(v1.12) for instance 'U_23' of 'xnor'
   din7 <= NOT(dout14 XOR dout15);

   -- Instance port mappings.

END struct;
