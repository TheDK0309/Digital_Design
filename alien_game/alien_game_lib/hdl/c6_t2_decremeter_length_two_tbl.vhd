-- VHDL Entity alien_game_lib.c6_t2_decremeter_length_two.symbol
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 00:12:29 12/ 7/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c6_t2_decremeter_length_two IS
   PORT( 
      data_in  : IN     std_logic_vector (1 DOWNTO 0);
      data_out : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END c6_t2_decremeter_length_two ;

--
-- VHDL Architecture alien_game_lib.c6_t2_decremeter_length_two.tbl
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 00:31:05 12/ 7/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ARCHITECTURE tbl OF c6_t2_decremeter_length_two IS
   
      -- Architecture declarations
    

BEGIN

   -----------------------------------------------------------------
   truth_process_proc: PROCESS(data_in)
   -----------------------------------------------------------------
   BEGIN
      -- Block 1
      IF (data_in = "00") THEN
         data_out <= "00";
      ELSIF (data_in = "01") THEN
         data_out <= "00";
      ELSIF (data_in = "10") THEN
         data_out <= "01";
      ELSIF (data_in = "11") THEN
         data_out <= "10";
      END IF;

   END PROCESS truth_process_proc;

-- Architecture concurrent statements
 

END tbl;
