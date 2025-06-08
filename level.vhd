library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity level is
   port (
      i_pwm   : in std_logic_vector(3 downto 0);
		o_level : out std_logic_vector(2 downto 0)
	);
end level;

architecture Behavioral of level is
   signal level : unsigned(2 downto 0);
begin

   process(i_pwm)
      variable count : natural := 0;
   begin
      count := 0;
      for i in 0 to 3 loop
         if i_pwm(i) = '1' then
            count := count + 1;
         end if;
      end loop;
      level <= to_unsigned(count, 3);
   end process;

	o_level <= std_logic_vector(level);
	
end Behavioral;