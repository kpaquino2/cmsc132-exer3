library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- test bench for NOT operaton
entity not_tb is
end entity not_tb;

architecture sim of not_tb is
    signal tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout : std_logic;
begin
    uut : entity work.alu(struc)
        port map(tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout);
    tester : process is
        variable test_in : unsigned(1 downto 0);
        variable error_count : integer := 0;
        variable output_0, output_1, output_c : std_logic;
    begin
        test_in := B"00"; -- initialize

        -- selectors for operation NOT
        tS0 <= '0';
        tS1 <= '1';
        tS2 <= '1';

        -- loop for testing
        for count in 0 to 3 loop
            tI0 <= test_in(1);
            tI1 <= test_in(0);
            wait for 10 ns;

            -- generate expected outputs
            output_0 := not tI0;
            output_1 := not tI1;
            output_c := '0';
            assert(output_0=tK0 and output_1=tK1 and output_c=tCout) report "NOT Gate error!" severity error;

            if (output_0/=tK0 or output_1/=tK1 or output_c/=tCout) then error_count := error_count + 1; end if;

            test_in := test_in + 1;
        end loop;

        report "Done with NOT operation test. There were " & integer'image(error_count) & " errors.";
        -- report the number of errors encountered

        wait;
    end process;
end architecture sim;