-- fsm.vhd: Finite State Machine
-- Author(s): Roman Fulla (xfulla00)
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST1,		  																 -- Rozhodne, ktory kod sa zadava (ak sa zadava spravny)

						  TEST2_CODE1,
						  TEST3_CODE1,
						  TEST4_CODE1,
						  TEST5_CODE1,
						  TEST6_CODE1,
						  TEST7_CODE1,
						  TEST8_CODE1,
						  TEST9_CODE1,
						  TEST10_CODE1,
						  TEST11_CODE1,

						  TEST2_CODE2,
						  TEST3_CODE2,
						  TEST4_CODE2,
						  TEST5_CODE2,
						  TEST6_CODE2,
						  TEST7_CODE2,
						  TEST8_CODE2,
						  TEST9_CODE2,
						  TEST10_CODE2,
						  TEST11_CODE2,

						  WRONG_CODE, 																 -- Bol zadany zly kod a caka sa na ukoncenie vstupu

						  PRINT_MESSAGE_GRANTED,
						  PRINT_MESSAGE_DENIED,

						  FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST1 =>		  																          -- Rozhodne, ktory kod sa zadava (ak sa zadava spravny)
      next_state <= TEST1;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(2) = '1') then
			next_state <= TEST2_CODE1;
		elsif (KEY(1) = '1') then
			next_state <= TEST2_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -

   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST2_CODE1 =>		  																    -- Kod 1
		next_state <= TEST2_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(2) = '1') then
			next_state <= TEST3_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST3_CODE1 =>
		next_state <= TEST3_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST4_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST4_CODE1 =>
		next_state <= TEST4_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST5_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST5_CODE1 =>
		next_state <= TEST5_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST6_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST6_CODE1 =>
		next_state <= TEST6_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(1) = '1') then
			next_state <= TEST7_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST7_CODE1 =>
		next_state <= TEST7_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(1) = '1') then
			next_state <= TEST8_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST8_CODE1 =>
		next_state <= TEST8_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST9_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST9_CODE1 =>
		next_state <= TEST9_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST10_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST10_CODE1 =>
		next_state <= TEST10_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(4) = '1') then
			next_state <= TEST11_CODE1;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST11_CODE1 =>
		next_state <= TEST11_CODE1;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_GRANTED;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -

	-- - - - - - - - - - - - - - - - - - - - - - -
	when TEST2_CODE2 =>		  																    -- Kod 2
		next_state <= TEST2_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(9) = '1') then
			next_state <= TEST3_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST3_CODE2 =>
		next_state <= TEST3_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(7) = '1') then
			next_state <= TEST4_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST4_CODE2 =>
		next_state <= TEST4_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(1) = '1') then
			next_state <= TEST5_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST5_CODE2 =>
		next_state <= TEST5_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(3) = '1') then
			next_state <= TEST6_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST6_CODE2 =>
		next_state <= TEST6_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(5) = '1') then
			next_state <= TEST7_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST7_CODE2 =>
		next_state <= TEST7_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(3) = '1') then
			next_state <= TEST8_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST8_CODE2 =>
		next_state <= TEST8_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(1) = '1') then
			next_state <= TEST9_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST9_CODE2 =>
		next_state <= TEST9_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(3) = '1') then
			next_state <= TEST10_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST10_CODE2 =>
		next_state <= TEST10_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_DENIED;
		elsif (KEY(8) = '1') then
			next_state <= TEST11_CODE2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when TEST11_CODE2 =>
		next_state <= TEST11_CODE2;
		if (KEY(15) = '1') then
			next_state <= PRINT_MESSAGE_GRANTED;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= WRONG_CODE;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -

   -- - - - - - - - - - - - - - - - - - - - - - -
   when WRONG_CODE => 																		    -- Bol zadany zly kod a caka sa na ukoncenie vstupu
      next_state <= WRONG_CODE;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_DENIED;		
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_DENIED =>
      next_state <= PRINT_MESSAGE_DENIED;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_GRANTED =>
      next_state <= PRINT_MESSAGE_GRANTED;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST1;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_MESSAGE_GRANTED =>
	  FSM_MX_MEM     <= '1';

     FSM_CNT_CE     <= '1';
     FSM_MX_LCD     <= '1';
     FSM_LCD_WR     <= '1';
	-- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_MESSAGE_DENIED =>
	  FSM_CNT_CE     <= '1';
     FSM_MX_LCD     <= '1';
     FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
		if (KEY(15) = '1') then
			FSM_LCD_CLR    <= '1';
		elsif (KEY(14 downto 0) /= "000000000000000") then
			FSM_LCD_WR     <= '1';
		end if;
   end case;
end process output_logic;

end architecture behavioral;

