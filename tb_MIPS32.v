module tb_MIPS32;
    reg clk1, clk2;
    integer k;

    // Instantiate the module under test
    pipe_MIPS32 uut(clk1, clk2);

    initial begin
        clk1 = 0; 
        clk2 = 0;

        // Generate two-phase clock
        repeat (20) begin
            #5 clk1 = 1; #5 clk1 = 0;
            #5 clk2 = 1; #5 clk2 = 0;
        end
    end

    initial begin
        // Initialize registers
        for (k = 0; k < 31; k = k + 1)
            uut.Reg[k] = k;

        // Initialize memory with instructions
        uut.Mem[0] = 32'h2801000a; // ADDI R1, R0, 10
        uut.Mem[1] = 32'h28020014; // ADDI R2, R0, 20
        uut.Mem[2] = 32'h28030019; // ADDI R3, R0, 25
        uut.Mem[3] = 32'h0ce77800; // OR R7, R7, R7 -- Dummy instruction
        uut.Mem[4] = 32'h0ce77800; // OR R7, R7, R7 -- Dummy instruction
        uut.Mem[5] = 32'h00222000; // ADD R4, R1, R2
        uut.Mem[6] = 32'h0ce77800; // OR R7, R7, R7 -- Dummy instruction
        uut.Mem[7] = 32'h00832800; // ADD R5, R4, R3
        uut.Mem[8] = 32'hfc000000; // HLT

        // Initialize control signals
        uut.HALTED = 0;
        uut.PC = 0;
        uut.TAKEN_BRANCH = 0;

        // Run simulation for a specific duration
        #280;

        // Display register values
        for (k = 0; k < 6; k = k + 1)
            $display("R%1d - %2d", k, uut.Reg[k]);
    end
endmodule
