library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity carriers is
   port (
		i_clk         : in std_logic;
		o_carrier1    : out std_logic_vector(7 downto 0);
		o_carrier2    : out std_logic_vector(7 downto 0);
		o_carrier3    : out std_logic_vector(7 downto 0);
		o_carrier4    : out std_logic_vector(7 downto 0)
	);
end carriers;

architecture Behavioral of carriers is
	
   constant C_MAX_CNT     : natural                  := 255;
   signal r_tri_cnt       : natural range 0 to 255   := 0;
   signal r_up_down       : std_logic                := '1'; -- '1' = up, '0' = down
	
begin

   o_carrier1   <= std_logic_vector(to_unsigned(r_tri_cnt / 4 + 192, 8));               -- 255 ↔ 192 
   o_carrier2   <= std_logic_vector(to_unsigned((C_MAX_CNT - r_tri_cnt) / 4 + 128, 8)); -- 192 ↔ 128  DEFASADO EM 180°
   o_carrier3   <= std_logic_vector(to_unsigned(r_tri_cnt / 4 + 64, 8));                -- 128 ↔ 64   
   o_carrier4   <= std_logic_vector(to_unsigned((C_MAX_CNT - r_tri_cnt) / 4 + 0, 8));   -- 64 ↔ 0     DEFASADO EM 180°
	 
   -- Triangle wave generator
   p_triangle_wave: process(i_clk)
   begin
		if rising_edge(i_clk) then
			if r_up_down = '1' then
				if r_tri_cnt = C_MAX_CNT then
					r_up_down <= '0';
					r_tri_cnt <= r_tri_cnt - 1;
				else
					r_tri_cnt <= r_tri_cnt + 1;
				end if;
			else
				if r_tri_cnt = 0 then
					r_up_down <= '1';
					r_tri_cnt <= r_tri_cnt + 1;
				else
					r_tri_cnt <= r_tri_cnt - 1;
				end if;
			end if;
		end if;
   end process;
	 

end Behavioral;
