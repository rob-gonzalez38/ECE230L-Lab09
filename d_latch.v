module d_latch(
    input D, E,
    output reg Q,
    output NotQ
);
    // Sensitivity list triggers on changes to D or E
    always @(D,E) begin
        if (E)
            Q <= D; // Non-blocking assignment
    end

    // Use continuous assignment for the inverse output
    assign NotQ = ~Q; 
endmodule