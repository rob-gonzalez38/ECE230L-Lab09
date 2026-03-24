module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    // Internal wires to hold the output of each 8-bit memory block
    wire [7:0] mem_out [3:0]; 
    reg [3:0] selected_store;

    // 1. Demultiplexer for the Store (Enable) signal
    always @(*) begin
        case(addr)
            2'b00: selected_store = {3'b000, store};
            2'b01: selected_store = {3'b00, store, 1'b0};
            2'b10: selected_store = {3'b0, store, 2'b00};
            2'b11: selected_store = {store, 3'b000};
            default: selected_store = 4'b0000;
        endcase
    end

    // 2. Instantiate 4 memory blocks using a generate loop
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            byte_memory mem_block (
                .data(data),
                .store(selected_store[i]),
                .memory(mem_out[i])
            );
        end
    endgenerate

    // 3. Multiplexer to select which byte to display on LEDs
    assign memory = mem_out[addr];

endmodule

/** 2nd Option:
module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory_out
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
    assign memory_out = (addr == 2'b00) ? m0 :
                        (addr == 2'b01) ? m1 :
                        (addr == 2'b10) ? m2 : m3;
endmodule

*/