-- VHDL Entity alien_game_lib.c5_t3_debounce_fsm.symbol
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 09:33:16 11/23/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t3_debounce_fsm IS
   PORT( 
      btn_in  : IN     std_logic;
      clk     : IN     std_logic;
      rst     : IN     std_logic;
      btn_out : OUT    std_logic
   );

-- Declarations

END c5_t3_debounce_fsm ;

--
-- VHDL Architecture alien_game_lib.c5_t3_debounce_fsm.fsm
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 11:16:35 11/23/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c5_t3_debounce_fsm IS

   -- Architecture Declarations
   SIGNAL count_stable : integer RANGE 30000000 DOWNTO 0;  

   TYPE STATE_TYPE IS (
      Idle,
      btn_oscillation,
      btn_recognized,
      btn_stable,
      btn_high
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(19 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(19 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_btn_oscillation : std_logic;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         current_state <= Idle;
         csm_timer <= (OTHERS => '0');
         -- Default Reset Values
         count_stable <= 0;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;

         -- Combined Actions
         CASE current_state IS
            WHEN btn_stable => 
               IF (count_stable = 10000000 AND btn_in = '1') THEN 
                  count_stable <= 0;
               ELSIF (btn_in = '1' AND count_stable < 10000000) THEN 
                  count_stable <= count_stable +1;
               ELSIF (count_stable < 10000000 AND btn_in = '0') THEN 
                  count_stable <= 0;
               END IF;
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      btn_in,
      count_stable,
      csm_timeout,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_btn_oscillation <= '0';
      CASE current_state IS
         WHEN Idle => 
            IF (btn_in = '1') THEN 
               next_state <= btn_oscillation;
               csm_to_btn_oscillation <= '1';
            ELSE
               next_state <= Idle;
            END IF;
         WHEN btn_oscillation => 
            IF (csm_timeout = '1' AND (btn_in = '1')) THEN 
               next_state <= btn_stable;
            ELSIF (csm_timeout = '1' AND (btn_in = '0')) THEN 
               next_state <= Idle;
            ELSE
               next_state <= btn_oscillation;
            END IF;
         WHEN btn_recognized => 
            IF (btn_in='0') THEN 
               next_state <= btn_oscillation;
               csm_to_btn_oscillation <= '1';
            ELSIF (btn_in <= '1') THEN 
               next_state <= btn_high;
            ELSE
               next_state <= btn_recognized;
            END IF;
         WHEN btn_stable => 
            IF (count_stable = 10000000 AND btn_in = '1') THEN 
               next_state <= btn_recognized;
            ELSIF (btn_in = '1' AND count_stable < 10000000) THEN 
               next_state <= btn_stable;
            ELSIF (count_stable < 10000000 AND btn_in = '0') THEN 
               next_state <= Idle;
            ELSE
               next_state <= btn_stable;
            END IF;
         WHEN btn_high => 
            IF (btn_in = '0') THEN 
               next_state <= btn_oscillation;
               csm_to_btn_oscillation <= '1';
            ELSIF (btn_in = '1') THEN 
               next_state <= btn_high;
            ELSE
               next_state <= btn_high;
            END IF;
         WHEN OTHERS =>
            next_state <= Idle;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN

      -- Combined Actions
      CASE current_state IS
         WHEN Idle => 
            btn_out <= '0' ;
         WHEN btn_oscillation => 
            btn_out <= '0' ;
         WHEN btn_recognized => 
            btn_out <= '1';
         WHEN btn_stable => 
            btn_out <= '0' ;
         WHEN btn_high => 
            btn_out<= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_btn_oscillation
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_btn_oscillation = '1') THEN
         csm_next_timer <= "11110100001000111111"; -- no cycles(1000000)-1=999999
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;
