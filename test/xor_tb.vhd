library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- test bench for XOR operaton
entity xor_tb is
end entity xor_tb;

architecture sim of xor_tb is
    signal tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout : std_logic;
begin
    uut : entity work.alu(struc)
        port map(tS0, tS1, tS2, tI0, tI1, tJ0, tJ1, tK0, tK1, tCout);
    tester : process is
        variable test_in : unsigned(3 downto 0);
        variable error_count : integer := 0;
        variable output_0, output_1, output_c : std_logic;
    begin
        test_in := B"0000"; -- initialize

        -- selectors for operation XOR
        tS0 <= '0';
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
            output_0 := tI0 xor tJ0;
            output_1 := tI1 xor tJ1;
            output_c := '0';
            assert(output_0=tK0 and output_1=tK1 and output_c=tCout) report "XOR Gate error!" severity error;

            if (output_0/=tK0 or output_1/=tK1 or output_c/=tCout) then error_count := error_count + 1; end if;

            test_in := test_in + 1;
        end loop;

        report "Done with XOR operation test. There were " & integer'image(error_count) & " errors.";
        -- report the number of errors encountered

        wait;
    end process;
end architecture sim;