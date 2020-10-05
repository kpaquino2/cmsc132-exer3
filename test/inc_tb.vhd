library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- test bench for INC operaton
entity inc_tb is
end entity inc_tb;

architecture sim of inc_tb is
    signal tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout : std_logic;
begin
    uut : entity work.alu(struc)
        port map(tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout);
    tester : process is
        variable test_in : unsigned(1 downto 0);
        variable error_count : integer := 0;
        variable output : unsigned(2 downto 0);
        variable tI : unsigned(2 downto 0);
    begin
        test_in := B"00"; -- initialize

        -- selectors for operation INC
        tS0 <= '1';
        tS1 <= '1';
        tS2 <= '1';

        -- loop for testing
        for count in 0 to 3 loop
            tI0 <= test_in(1);
            tI1 <= test_in(0);
            wait for 10 ns;

            -- generate expected outputs
            tI := '0' & tI0 & tI1;
            output := tI + 1;

            assert(tK0=output(1) and output(0)=tK1 and output(2)=tCout) report "INC error!" severity error;

            if (output(1)/=tK0 or output(0)/=tK1 or output(2)/=tCout) then error_count := error_count + 1; end if;

            test_in := test_in + 1;
        end loop;

        report "Done with INC operation test. There were " & integer'image(error_count) & " errors.";
        -- report the number of errors encountered

        wait;
    end process;
end architecture sim;