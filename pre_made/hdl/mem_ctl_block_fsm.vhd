-- VHDL Entity pre_made.mem_ctl_block.symbol
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 22:10:28 12/ 5/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;

ENTITY mem_ctl_block IS
   PORT( 
      clk         : IN     std_logic;
      pixd_w_done : IN     std_logic;
      rst_n       : IN     std_logic;
      banksel     : OUT    std_logic;
      nullify     : OUT    std_logic;
      w_rdy       : OUT    std_logic
   );

-- Declarations

END mem_ctl_block ;

--
-- VHDL Architecture pre_made.mem_ctl_block.fsm
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 22:14:50 12/ 5/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;


ARCHITECTURE fsm OF mem_ctl_block IS

   -- Architecture declarations
   TYPE STATE_TYPE IS(z77ca48e55,zd561de642,zfbdccd934,z0f0974e71);
   -- Non hierarchical state machine declarations
   TYPE ZDF0BE1CE6_STATE_TYPE IS (
      z77ca48e55,
      zd561de642,
      zfbdccd934,
      z0f0974e71
   );
 
   -- Declare current and next state signals
   SIGNAL zdf0be1ce6 : ZDF0BE1CE6_STATE_TYPE;
   SIGNAL ze8e79043b : ZDF0BE1CE6_STATE_TYPE;


   -- Internal signal declarations
   SIGNAL ze03a9bfed : std_logic;
   SIGNAL z0650cbe3e : std_logic;



BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Block 1 SM
   -- Non hierarchical state machine
   -----------------------------------------------------------------
   zdf0be1ce6_clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n='0') THEN
         zdf0be1ce6 <= z77ca48e55;
         -- Default Reset Values
         ze03a9bfed <= '0';
         z0650cbe3e <= '0';
      ELSIF (clk'EVENT AND clk='1') THEN
         zdf0be1ce6 <= ze8e79043b;

         -- Combined Actions
         CASE zdf0be1ce6 IS
            WHEN zd561de642 => 
               ze03a9bfed<=not ze03a9bfed;
            WHEN zfbdccd934 => 
               z0650cbe3e<='1';
            WHEN z0f0974e71 => 
               z0650cbe3e<='0';
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS zdf0be1ce6_clocked_proc;
 
   -----------------------------------------------------------------
   zdf0be1ce6_nextstate_proc : PROCESS ( 
      pixd_w_done,
      zdf0be1ce6
   )
   -----------------------------------------------------------------
   BEGIN
      CASE zdf0be1ce6 IS
         WHEN z77ca48e55 => 
            IF ((pixd_w_done='1')) THEN 
               ze8e79043b <= zd561de642;
            ELSE
               ze8e79043b <= z77ca48e55;
            END IF;
         WHEN zd561de642 => 
            ze8e79043b <= zfbdccd934;
         WHEN zfbdccd934 => 
            ze8e79043b <= z0f0974e71;
         WHEN z0f0974e71 => 
            IF ((pixd_w_done='0')) THEN 
               ze8e79043b <= z77ca48e55;
            ELSE
               ze8e79043b <= z0f0974e71;
            END IF;
         WHEN OTHERS =>
            ze8e79043b <= z77ca48e55;
      END CASE;
   END PROCESS zdf0be1ce6_nextstate_proc;
 
   -----------------------------------------------------------------
   zdf0be1ce6_output_proc : PROCESS ( 
      zdf0be1ce6
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      w_rdy <= '0';

      -- Combined Actions
      CASE zdf0be1ce6 IS
         WHEN z77ca48e55 => 
            w_rdy<='1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS zdf0be1ce6_output_proc;
 


   -- HDL Embedded Text Block 2 eb1
   banksel<=ze03a9bfed;
   nullify<=z0650cbe3e;


   -- Instance port mappings.

END fsm;
