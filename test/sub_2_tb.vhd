library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- test bench for SUB(2) operaton
entity sub_2_tb is
end entity sub_2_tb;

architecture sim of sub_2_tb is
    signal tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout : std_logic;
begin
    uut : entity work.alu(struc)
        port map(tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout);
    tester : process is
        variable test_in : unsigned(3 downto 0);
        variable error_count : integer := 0;
        variable output : unsigned(2 downto 0);
        variable tI, tJ : unsigned(2 downto 0);
    begin
        test_in := B"0000"; -- initialize

        -- selectors for operation SUB(1)
        tS0 <= '1';
        tS1 <= '1';
        tS2 <= '0';

        -- loop for testing
        for count in 0 to 15 loop
            tI0 <= test_in(3);
            tI1 <= test_in(2);
            tJ0 <= test_in(1);
            tJ1 <= test_in(0);
            wait for 10 ns;

            -- generate expected outputs
            tI := '0' & tI0 & tI1;
            tJ := '0' & not tJ0 & not tJ1 + 1;
            output := tI + tJ;

            assert(tK0=output(1) and output(0)=tK1 and output(2)=tCout) report "SUB(2) operation error!" severity error;

            if (output(1)/=tK0 or output(0)/=tK1 or output(2)/=tCout) then error_count := error_count + 1; end if;

            test_in := test_in + 1;
        end loop;

        report "Done with SUB(2) operation test. There were " & integer'image(error_count) & " errors.";
        -- report the number of errors encountered

        wait;
    end process;
end architecture sim;