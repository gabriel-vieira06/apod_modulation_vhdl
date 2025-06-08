library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
   port (
		i_sine     : in std_logic_vector(7 downto 0);
		i_carrier1 : in std_logic_vector(7 downto 0);
		i_carrier2 : in std_logic_vector(7 downto 0);
		i_carrier3 : in std_logic_vector(7 downto 0);
		i_carrier4 : in std_logic_vector(7 downto 0);
		o_pwm      : out std_logic_vector(3 downto 0)
	);
end comparator;

architecture Behavioral of comparator is

begin

	o_pwm(0) <= '1' when unsigned(i_sine) > unsigned(i_carrier1) else '0';
	o_pwm(1) <= '1' when unsigned(i_sine) > unsigned(i_carrier2) else '0';
	o_pwm(2) <= '1' when unsigned(i_sine) > unsigned(i_carrier3) else '0';
	o_pwm(3) <= '1' when unsigned(i_sine) > unsigned(i_carrier4) else '0';

end Behavioral;