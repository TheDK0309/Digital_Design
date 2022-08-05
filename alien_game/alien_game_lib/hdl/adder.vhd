-------------------------------------------------------------------------------
-- Title      : Generic Adder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : adder.vhd
-- Author     : 14 - Minh Nguyen, Veronika Blazhko
-- Company    : 
-- Created    : 2020-11-11
-- Last update: 2020-11-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-11-11  1.0      Minh    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Adder structure
entity adder is
  generic (
    operand_width_g : integer);
  port(
    rst_n   : in  std_logic;
    clk     : in  std_logic;
    a_in    : in  std_logic_vector (operand_width_g-1 downto 0);
    b_in    : in  std_logic_vector (operand_width_g-1 downto 0);
    sum_out : out std_logic_vector (operand_width_g downto 0)
    );
end adder;

-- rtl architecture
architecture rtl of adder is
  signal res : signed (operand_width_g downto 0);
  signal sa  : signed (operand_width_g-1 downto 0);
  signal sb  : signed (operand_width_g-1 downto 0);
begin
  sum_out <= std_logic_vector(res);
  sa      <= signed(a_in);                -- convert inputs to signed type
  sb      <= signed(b_in);
  -----------------------------------------------------------------------------
  -- Synchronous sum process calculate sum for a_in and b_in
  -----------------------------------------------------------------------------
  sync_sum : process (rst_n, clk)
  begin
    if(rst_n = '0') then                  -- async low reset
      res <= (others => '0');
    elsif (clk'event and clk = '1') then  -- rising clock edge event
                                          -- resize to width of result and sum terms sa,sb
      res <= resize(sa, operand_width_g+1) + resize(sb, operand_width_g+1);
    end if;
  end process;
end rtl;
