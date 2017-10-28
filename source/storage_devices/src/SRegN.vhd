library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SRegN is
	generic (
		n : integer := 4 
		);
	
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN : in std_logic;
		INIT : in std_logic;
		CLK : in std_logic;
		OE : in std_logic;
		Dout : out std_logic_vector(n-1 downto 0)
		);
end SRegN;

architecture beh of SRegN is
	signal reg : std_logic_vector(n-1 downto 0);
	constant NO_OUTPUT : std_logic_vector(n-1 downto 0) := (others => 'Z');
begin
	main : process(Din, EN, INIT, CLK)
	begin
		if INIT = '1' then
			reg <= (others => '0');
		elsif EN = '1' then
			if rising_edge(CLK) then
				reg <= Din;
			end if;
		end if;
	end process;
	
	Dout <= reg when OE='0' else NO_OUTPUT;
end beh;	