module top(
    input [15:0] sw,     // 16 Switches
    input btnC,          // Center Button (Store/Enable)
    output [15:0] led    // 16 LEDs
);

    // --- Part 1: Single Bit Memory ---
    // Connects sw[0] to Data, btnC to Enable
    // Outputs to led[0] (Q) and led[1] (~Q)
    d_latch part1(
        .D(sw[0]),
        .E(btnC),
        .Q(led[0]),
        .NotQ(led[1])
    );

    // --- Part 2: Four Byte Memory System ---
    // sw[15:8] = Input Data (8 bits)
    // sw[7:6]  = Address Select (2 bits)
    // btnC     = Store Command
    // led[15:8]= Output Data (8 bits)
    memory_system part2(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led[15:8])
    );
    
    assign led[7:2] = 6'b0;

endmodule