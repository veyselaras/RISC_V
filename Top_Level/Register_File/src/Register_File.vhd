LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY REGISTER_FILE IS
PORT
(
	CLK						: IN STD_LOGIC;
	--INPUTS
	I_READ_REGISTER_1		: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	I_READ_REGISTER_2		: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	I_WRITE_REGISTER		: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	I_WRITE_DATA			: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	--1'SE YAZ 0'SA YAZMA
	I_CONTROL_WRITE			: IN STD_LOGIC;
	
	--OUTPUTS
	O_READ_DATA_1			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	O_READ_DATA_2			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END REGISTER_FILE;

ARCHITECTURE ARCH_OF_REGISTER_FILE OF REGISTER_FILE IS

	TYPE MEM IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL READ_RAM_REGISTER_1		: INTEGER RANGE 0 TO 31;
	SIGNAL READ_RAM_REGISTER_2		: INTEGER RANGE 0 TO 31;
	SIGNAL I_WRITE_REGISTER_INT	: INTEGER RANGE 0 TO 31;
	
	SIGNAL RAM_BLOCK: MEM := (
        x"01ab01ab",  -- Adres 0
        x"01ab2823",  -- Adres 1
        x"01ab50d1",  -- Adres 2
        x"01ab24a5",  -- Adres 3
        x"01ab016c",  -- Adres 4
        x"01ab2811",  -- Adres 5
        x"01ab5000",  -- Adres 6
        x"01ab25a3",  -- Adres 7
        x"01ab01d1",  -- Adres 8
        x"01ab28a1",  -- Adres 9
        x"01ab50b5",  -- Adres 10
        x"01ab267c",  -- Adres 11
        x"01ab019a",  -- Adres 12
        x"01ab2899",  -- Adres 13
        x"01ab50a2",  -- Adres 14
        x"01ab27b0",  -- Adres 15
        x"01ab0100",  -- Adres 16
        x"01ab2801",  -- Adres 17
        x"01ab5002",  -- Adres 18
        x"01ab2864",  -- Adres 19
        x"01ab0124",  -- Adres 20
        x"01ab28c4",  -- Adres 21
        x"01ab50c6",  -- Adres 22
        x"01ab29a7",  -- Adres 23
        x"01ab01d2",  -- Adres 24
        x"01ab2888",  -- Adres 25
        x"01ab5077",  -- Adres 26
        x"01ab2A66",  -- Adres 27
        x"01ab0136",  -- Adres 28
        x"01ab2826",  -- Adres 29
        x"01ab5064",  -- Adres 30
        x"01ab2B91"   -- Adres 31
    );
BEGIN
	I_WRITE_REGISTER_INT <= TO_INTEGER(UNSIGNED(I_WRITE_REGISTER));
	READ_REGISTERS:PROCESS(CLK)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN
			IF(I_CONTROL_WRITE = '0') THEN
				READ_RAM_REGISTER_1 <= TO_INTEGER(UNSIGNED(I_READ_REGISTER_1));
				READ_RAM_REGISTER_2 <= TO_INTEGER(UNSIGNED(I_READ_REGISTER_2));
			ELSE
				RAM_BLOCK(I_WRITE_REGISTER_INT) <= I_WRITE_DATA;
			END IF;
		END IF;
	END PROCESS;
	O_READ_DATA_1 <= RAM_BLOCK(READ_RAM_REGISTER_1);
	O_READ_DATA_2 <= RAM_BLOCK(READ_RAM_REGISTER_2);
	
END ARCH_OF_REGISTER_FILE;