module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo 
  output reg [10:0] saida
);

wire [3:0] posicao_erro;
reg [14:0] corrigido;

assign posicao_erro[0] = entrada[14] ^ entrada[12] ^ entrada[10] ^ entrada[8] ^ entrada[6] ^ entrada[4] ^ entrada[2] ^ entrada[0];
assign posicao_erro[1] = entrada[13] ^ entrada[12] ^ entrada[9]  ^ entrada[8] ^ entrada[5] ^ entrada[4] ^ entrada[1] ^ entrada[0];
assign posicao_erro[2] = entrada[11] ^ entrada[10] ^ entrada[9] ^  entrada[8] ^ entrada[3] ^ entrada[2] ^ entrada[1] ^ entrada[0];
assign posicao_erro[3] = entrada[7]  ^ entrada[6] ^  entrada[5] ^  entrada[4] ^ entrada[3] ^ entrada[2] ^ entrada[1] ^ entrada[0];

// se bit 14, 13, 11 ou 7 ativo, há erro
always @(*) begin
  if (posicao_erro != 0) begin
    corrigido = entrada ^ (15'b1 << posicao_erro); // Inverter bit errado
  end
  else begin
    corrigido = entrada;
  end
end


// saida apenas os bits de dados
always @(*) begin
  saida = {
    corrigido[12],      
    corrigido[10],      
    corrigido[9],      
    corrigido[8],      
    corrigido[6],      
    corrigido[5],      
    corrigido[4],      
    corrigido[3],
    corrigido[2],
    corrigido[1],
    corrigido[0]};
end

endmodule
