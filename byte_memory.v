module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory
);
    // Behavioral D-Latch logic for 8 bits
    always @(data, store) begin
        if (store)
            memory <= data; // Non-blocking assignment
    end
endmodule