library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Instruction_Memory is
    port (
        clk  : in  std_logic;                     -- Saat sinyali
        I_ADDRESS 		: in  std_logic_vector(31 downto 0); -- 32 bit adres giriş
        O_INSTRUCTION 	: out std_logic_vector(31 downto 0)  -- 32 bit veri çıkış
    );
end Instruction_Memory;

architecture behavioral of Instruction_Memory is

    -- 32x8 bitlik sabit ROM tablosunu (icerigini) tanimliyoruz:
    type rom_type is array (0 to 31) of std_logic_vector(7 downto 0);

    -- Burada örnek olsun diye x"..." biçiminde hex değerler kullanıyoruz.
    constant ROM_CONTENT : rom_type := (
        x"01",  -- Adres 0
        x"28",  -- Adres 1
        x"50",  -- Adres 2
        x"24",  -- Adres 3
        x"01",  -- Adres 4
        x"28",  -- Adres 5
        x"50",  -- Adres 6
        x"25",  -- Adres 7
        x"01",  -- Adres 8
        x"28",  -- Adres 9
        x"50",  -- Adres 10
        x"26",  -- Adres 11
        x"01",  -- Adres 12
        x"28",  -- Adres 13
        x"50",  -- Adres 14
        x"27",  -- Adres 15
        x"01",  -- Adres 16
        x"28",  -- Adres 17
        x"50",  -- Adres 18
        x"28",  -- Adres 19
        x"01",  -- Adres 20
        x"28",  -- Adres 21
        x"50",  -- Adres 22
        x"29",  -- Adres 23
        x"01",  -- Adres 24
        x"28",  -- Adres 25
        x"50",  -- Adres 26
        x"2A",  -- Adres 27
        x"01",  -- Adres 28
        x"28",  -- Adres 29
        x"50",  -- Adres 30
        x"2B"   -- Adres 31
    );

begin

    -- Senkron (clock eşliğinde) ROM okuma
    process(clk)
    begin
        if rising_edge(clk) then
            -- Adresin işaret ettiği ROM hücresini O_INSTRUCTION'a ata.
            O_INSTRUCTION <= 	ROM_CONTENT(to_integer(unsigned(I_ADDRESS(15 downto 0)))) & ROM_CONTENT(to_integer(unsigned(I_ADDRESS(15 downto 0)))+1) & 
				ROM_CONTENT(to_integer(unsigned(I_ADDRESS(15 downto 0)))+2) & ROM_CONTENT(to_integer(unsigned(I_ADDRESS(15 downto 0)))+3);
        
		  end if;
    end process;

end behavioral;
