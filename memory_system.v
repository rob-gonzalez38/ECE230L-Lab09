module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    wire [7:0] m0, m1, m2, m3;
    reg [3:0] sel_store;

    // Demultiplexer for the Store signal
    always @(*) begin
        case(addr)
            2'b00: sel_store = 4'b0001 & {4{store}};
            2'b01: sel_store = 4'b0010 & {4{store}};
            2'b10: sel_store = 4'b0100 & {4{store}};
            2'b11: sel_store = 4'b1000 & {4{store}};
            default: sel_store = 4'b0000;
        endcase
    end

    // Four Byte instances
    byte_memory b0(data, sel_store[0], m0);
    byte_memory b1(data, sel_store[1], m1);
    byte_memory b2(data, sel_store[2], m2);
    byte_memory b3(data, sel_store[3], m3);

    // Multiplexer for Output
    assign memory = (addr == 2'b00) ? m0 :
                        (addr == 2'b01) ? m1 :
                        (addr == 2'b10) ? m2 : m3;
endmodule