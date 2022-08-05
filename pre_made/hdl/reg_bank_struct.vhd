--* ><(((('> * Puli puli * ><(((('> // Ƹ̵̡Ӝ̵̨̄Ʒ * swish swish* Ƹ̵̡Ӝ̵̨̄Ʒ Ƹ̵̡Ӝ̵̨̄Ʒ // (っ◕‿◕)╭∩╮^H^H^Hっ
LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ENTITY reg_bank IS PORT(clk:IN std_logic;pixd_in:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic;w_done:IN std_logic;write:IN std_logic;xr:IN std_logic_vector(7 DOWNTO 0);xw:IN std_logic_vector(7 DOWNTO 0);yr:IN std_logic_vector(7 DOWNTO 0);yw:IN std_logic_vector(7 DOWNTO 0);pixd_out:OUT std_logic_vector(23 DOWNTO 0);w_rdy:OUT std_logic);END reg_bank ;LIBRARY ieee;USE ieee.std_logic_1164.all;USE ieee.std_logic_arith.all;ARCHITECTURE struct OF reg_bank IS SIGNAL banksel:std_logic;SIGNAL ze72d2c2a4:std_logic_vector(7 DOWNTO 0);SIGNAL z508ec0017:std_logic;SIGNAL zb48298c48:std_logic;SIGNAL z9f041aaff:std_logic;SIGNAL zcf058ee7c:std_logic;SIGNAL z75dc1577a:std_logic_vector(7 DOWNTO 0);SIGNAL z833ab3bd5:std_logic_vector(7 DOWNTO 0);SIGNAL zc57c46db4:std_logic_vector(7 DOWNTO 0);SIGNAL z1ea89dc0d:std_logic_vector(7 DOWNTO 0);SIGNAL zcd48e1f4f:std_logic_vector(7 DOWNTO 0);SIGNAL z36424fa31:std_logic_vector(7 DOWNTO 0);SIGNAL z0068e7d64:std_logic_vector(7 DOWNTO 0);SIGNAL zb30429bb4:std_logic_vector(7 DOWNTO 0);SIGNAL nullify:std_logic;SIGNAL pix_out:std_logic_vector(23 DOWNTO 0);SIGNAL zb488040b4:std_logic_vector(23 DOWNTO 0);SIGNAL x:std_logic_vector(7 DOWNTO 0);SIGNAL z00b23bf66:std_logic_vector(7 DOWNTO 0);SIGNAL y:std_logic_vector(7 DOWNTO 0);SIGNAL zd4810c102:std_logic_vector(7 DOWNTO 0);COMPONENT mem_ctl_block PORT(clk:IN std_logic ;pixd_w_done:IN std_logic ;rst_n:IN std_logic ;banksel:OUT std_logic ;nullify:OUT std_logic ;w_rdy:OUT std_logic);END COMPONENT;COMPONENT reg_bank_64px PORT(clk:IN std_logic ;nullify:IN std_logic ;zd58ce0c39:IN std_logic_vector(23 DOWNTO 0);rst_n:IN std_logic ;write:IN std_logic ;x:IN std_logic_vector(7 DOWNTO 0);y:IN std_logic_vector(7 DOWNTO 0);pix_out:OUT std_logic_vector(23 DOWNTO 0));END COMPONENT;BEGIN z508ec0017<=nullify AND banksel;zb48298c48<=nullify AND NOT(banksel);z75dc1577a<=xw AND ze72d2c2a4;z833ab3bd5<=NOT(ze72d2c2a4)AND xr;zc57c46db4<=yw AND ze72d2c2a4;z1ea89dc0d<=NOT(ze72d2c2a4)AND yr;zcd48e1f4f<=xw AND NOT(ze72d2c2a4);z36424fa31<=ze72d2c2a4 AND xr;z0068e7d64<=yw AND NOT(ze72d2c2a4);zb30429bb4<=ze72d2c2a4 AND yr;z9f041aaff<=NOT(banksel)AND write;zcf058ee7c<=write AND banksel;ze72d2c2a4<=banksel & banksel & banksel & banksel & banksel & banksel & banksel & banksel;z33254a172:PROCESS(pix_out, zb488040b4, banksel)BEGIN CASE banksel IS WHEN'0'=>pixd_out<=pix_out;WHEN'1'=>pixd_out<=zb488040b4;WHEN OTHERS=>pixd_out<=(OTHERS=>'X');END CASE;END PROCESS z33254a172;x<=z75dc1577a OR z833ab3bd5;z00b23bf66<=zcd48e1f4f OR z36424fa31;y<=zc57c46db4 OR z1ea89dc0d;zd4810c102<=z0068e7d64 OR zb30429bb4;U_2:mem_ctl_block PORT MAP(clk=>clk,pixd_w_done=>w_done,rst_n=>rst_n,banksel=>banksel,nullify=>nullify,w_rdy=>w_rdy);U_0:reg_bank_64px PORT MAP(clk=>clk,nullify=>z508ec0017,zd58ce0c39=>pixd_in,rst_n=>rst_n,write=>zcf058ee7c,x=>x,y=>y,pix_out=>pix_out);U_1:reg_bank_64px PORT MAP(clk=>clk,nullify=>zb48298c48,zd58ce0c39=>pixd_in,rst_n=>rst_n,write=>z9f041aaff,x=>z00b23bf66,y=>zd4810c102,pix_out=>zb488040b4);END struct;