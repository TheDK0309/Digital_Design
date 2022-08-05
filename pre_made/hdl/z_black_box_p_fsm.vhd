--* ><(((('> * Puli puli * ><(((('> // Ƹ̵̡Ӝ̵̨̄Ʒ * swish swish* Ƹ̵̡Ӝ̵̨̄Ʒ Ƹ̵̡Ӝ̵̨̄Ʒ // (っ◕‿◕)╭∩╮^H^H^Hっ
LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ENTITY z_black_box_p IS PORT(z9544d0e66:IN std_logic_vector(7 DOWNTO 0);zf54907441:IN std_logic;z5efa2601c:IN std_logic_vector(7 DOWNTO 0);zd1385ccb0:IN std_logic_vector(23 DOWNTO 0);clk:IN std_logic;rst_n:IN std_logic;frame_done:OUT std_logic;z3417d2827:OUT std_logic_vector(23 DOWNTO 0);write:OUT std_logic;z187d0b354:OUT std_logic_vector(7 DOWNTO 0);z88ece3df0:OUT std_logic_vector(7 DOWNTO 0));END z_black_box_p ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE fsm OF z_black_box_p IS TYPE STATE_TYPE IS(zcc6a9714f,z4eb4d8e90,zb87856e18);SIGNAL zdf0be1ce6:STATE_TYPE;SIGNAL ze8e79043b:STATE_TYPE;BEGIN z9149816e0:PROCESS(clk,rst_n)BEGIN IF(rst_n='0')THEN zdf0be1ce6<=zcc6a9714f;ELSIF(clk'EVENT AND clk='1')THEN zdf0be1ce6<=ze8e79043b;END IF;END PROCESS z9149816e0;z145fbcc0d:PROCESS(zf54907441,zdf0be1ce6)BEGIN CASE zdf0be1ce6 IS WHEN zcc6a9714f=>IF(zf54907441='1')THEN ze8e79043b<=z4eb4d8e90;ELSE ze8e79043b<=zcc6a9714f;END IF;WHEN z4eb4d8e90=>ze8e79043b<=zb87856e18;WHEN zb87856e18=>ze8e79043b<=zcc6a9714f;WHEN OTHERS=>ze8e79043b<=zcc6a9714f;END CASE;END PROCESS z145fbcc0d;z822bdb2c3:PROCESS(z9544d0e66,z5efa2601c,zd1385ccb0,zdf0be1ce6)BEGIN frame_done<='0';z3417d2827<=(others=>'0');write<='0';z187d0b354<=(others=>'0');z88ece3df0<=(others=>'0');CASE zdf0be1ce6 IS WHEN z4eb4d8e90=>z187d0b354<=z9544d0e66;z88ece3df0<=z5efa2601c;z3417d2827<=zd1385ccb0;write<='1';WHEN zb87856e18=>frame_done<='1';WHEN OTHERS=>NULL;END CASE;END PROCESS z822bdb2c3;END fsm;