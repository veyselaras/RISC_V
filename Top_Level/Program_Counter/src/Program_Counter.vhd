library IEEE;
use ieee.std_logic_1164.all;

entity Program_Counter is
port
(
	clk		: in std_logic;
	rst		: in std_logic;
	PC_in	: in std_logic_vector(31 downto 0);
	PC_out	: out std_logic_vector(31 downto 0)
);
end Program_Counter;

architecture arc_of_PC of Program_Counter is

begin

	PC_process:process(clk,rst)
	begin
		if rst='0' then
			PC_out 		<= x"00000000";
		elsif rising_edge(clk) then
			PC_out 	<= PC_in;
		end if;
	end process;

end arc_of_PC;