-- VHDL Entity alien_game_lib.c3_t2_bullet.symbol
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 22:30:55 10/ 8/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_bullet IS
   PORT( 
      Gun_X_coord    : IN     std_logic_vector (7 DOWNTO 0);
      btn            : IN     std_logic_vector (3 DOWNTO 0);
      clk            : IN     std_logic;
      enable         : IN     std_logic;
      rst_n          : IN     std_logic;
      Bullet_X_coord : OUT    std_logic_vector (7 DOWNTO 0);
      Bullet_Y_coord : OUT    std_logic_vector (7 DOWNTO 0);
      Color          : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END c3_t2_bullet ;

--
-- VHDL Architecture alien_game_lib.c3_t2_bullet.fsm
--
-- Created:
--          by - Minh.UNKNOWN (DESKTOP-R6EVFEE)
--          at - 11:50:34 11/11/2020
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c3_t2_bullet IS

   TYPE STATE_TYPE IS (
      Idle,
      Bullet_flying1,
      Bullet_flying2,
      Bullet_flying3,
      Bullet_flying4,
      Bullet_flying5,
      Bullet_flying6
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk
   )
   -----------------------------------------------------------------
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         IF (enable = '1') THEN
            IF (rst_n = '0') THEN
               current_state <= Idle;
            ELSE
               current_state <= next_state;
            END IF;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      btn,
      current_state,
      enable
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN Idle => 
            IF (btn(0) = '1') THEN 
               next_state <= Bullet_flying1;
            ELSIF (btn(0) = '0') THEN 
               next_state <= Idle;
            END IF;
         WHEN Bullet_flying1 => 
            IF (enable = '1') THEN 
               next_state <= Bullet_flying2;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying1;
            ELSE
               next_state <= Bullet_flying1;
            END IF;
         WHEN Bullet_flying2 => 
            IF (enable = '1') THEN 
               next_state <= Bullet_flying3;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying2;
            ELSE
               next_state <= Bullet_flying2;
            END IF;
         WHEN Bullet_flying3 => 
            IF (enable = '1') THEN 
               next_state <= Bullet_flying4;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying3;
            ELSE
               next_state <= Bullet_flying3;
            END IF;
         WHEN Bullet_flying4 => 
            IF (enable = '1') THEN 
               next_state <= Bullet_flying5;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying4;
            ELSE
               next_state <= Bullet_flying4;
            END IF;
         WHEN Bullet_flying5 => 
            IF (enable = '1') THEN 
               next_state <= Bullet_flying6;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying5;
            ELSE
               next_state <= Bullet_flying5;
            END IF;
         WHEN Bullet_flying6 => 
            IF (enable = '1') THEN 
               next_state <= Idle;
            ELSIF (btn(2) = '1' AND enable = '1') THEN 
               next_state <= Bullet_flying1;
            ELSIF (enable = '0') THEN 
               next_state <= Bullet_flying6;
            ELSE
               next_state <= Bullet_flying6;
            END IF;
         WHEN OTHERS =>
            next_state <= Idle;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      Gun_X_coord,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN

      -- Combined Actions
      CASE current_state IS
         WHEN Idle => 
            Bullet_X_coord <= Gun_X_coord;
            Bullet_Y_coord <= "01000000";
            Color <= x"808080";
         WHEN Bullet_flying1 => 
            Bullet_Y_coord <= "00100000";
            Color <= x"808080";
         WHEN Bullet_flying2 => 
            Bullet_Y_coord <= "00010000";
            Color <= x"808080";
         WHEN Bullet_flying3 => 
            Bullet_Y_coord <= "00001000";
            Color <= x"808080";
         WHEN Bullet_flying4 => 
            Bullet_Y_coord <= "00000100";
            Color <= x"808080";
         WHEN Bullet_flying5 => 
            Bullet_Y_coord <= "00000010";
            Color <= x"808080";
         WHEN Bullet_flying6 => 
            Bullet_Y_coord <= "00000001";
            Color <= x"808080";
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
