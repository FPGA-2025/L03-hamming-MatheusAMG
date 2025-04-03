module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);

assign saida[12] = entrada[10];
assign saida[10:8] = entrada[9:7];
assign saida[6:0] = entrada[6:0];


assign saida[14] = entrada[10] ^ entrada[9] ^ entrada[7] ^ entrada[6] ^ entrada[4] ^ entrada[2] ^ entrada[0]; //p1
assign saida[13] = entrada[10] ^ entrada[8] ^ entrada[7] ^ entrada[5] ^ entrada[4] ^ entrada[1] ^ entrada[0]; //p2
assign saida[11] =  entrada[9] ^ entrada[8] ^ entrada[7] ^ entrada[3] ^ entrada[2] ^ entrada[1] ^ entrada[0]; //p3
assign saida[7] =   entrada[6] ^ entrada[5] ^ entrada[4] ^ entrada[3] ^ entrada[2] ^ entrada[1] ^ entrada[0]; //p8

endmodule
