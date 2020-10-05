library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture sim of alu_tb is
    signal tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout : std_logic;
begin
    uut : entity work.alu(struc)
        port map(tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout);
    tester : process is
        variable test_in : unsigned(6 downto 0);
    begin
        test_in := B"0000000";
        for count in 0 to 127 loop
            tS0 <= test_in(6);
            tS1 <= test_in(5);
            tS2 <= test_in(4);
            tI0 <= test_in(3);
            tI1 <= test_in(2);
            tJ0 <= test_in(1);
            tJ1 <= test_in(0);
            wait for 10 ns;

            test_in := test_in + 1;
        end loop;

        wait;
    end process;
end architecture sim;