library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clk_divider is
   generic ( G_MAX_COUNT : natural := 25e6 );
   port (
      i_clk : in std_logic;
      o_clk : out std_logic
   );
end clk_divider;

architecture Behavioral of clk_divider is

   signal r_edge_counter : natural range 0 to G_MAX_COUNT - 1 := 0;
   signal r_clk          : std_logic                          := '0';
	 
begin

   process(i_clk)
   begin
      if rising_edge(i_clk) then
         if r_edge_counter = G_MAX_COUNT - 1 then
            r_edge_counter <= 0;
            r_clk          <= not r_clk;
         else
            r_edge_counter <= r_edge_counter + 1;
         end if;
      end if;
   end process;

   o_clk <= r_clk;
	 
end Behavioral;