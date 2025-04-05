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
  corrigido = entrada;
  if (posicao_erro == 4'b0001) begin
    corrigido[0] = ~corrigido[0]; // Inverter bit errado
  end
  else if(posicao_erro == 4'b0010)begin
    corrigido[1] = ~corrigido[1];
  end
  else if(posicao_erro == 4'b0011)begin
    corrigido[2] = ~corrigido[2];
  end
  else if(posicao_erro == 4'b0100)begin
    corrigido[3] = ~corrigido[3];
  end
  else if(posicao_erro == 4'b0101)begin
    corrigido[4] = ~corrigido[4];
  end
  else if(posicao_erro == 4'b0110)begin
    corrigido[5] = ~corrigido[5];
  end
  else if(posicao_erro == 4'b0111)begin
    corrigido[6] = ~corrigido[6];
  end
  else if(posicao_erro == 4'b1000)begin
    corrigido[7] = ~corrigido[7];
  end
  else if(posicao_erro == 4'b1001)begin
    corrigido[8] = ~corrigido[8];
  end
  else if(posicao_erro == 4'b1010)begin
    corrigido[9] = ~corrigido[9];
  end
  else if(posicao_erro == 4'b1011)begin
    corrigido[10] = ~corrigido[10];
  end
  else if(posicao_erro == 4'b1100)begin
    corrigido[11] = ~corrigido[11];
  end
  else if(posicao_erro == 4'b1101)begin
    corrigido[12] = ~corrigido[12];
  end
  else if(posicao_erro == 4'b1110)begin
    corrigido[13] = ~corrigido[13];
  end
  else if(posicao_erro == 4'b1111)begin
    corrigido[14] = ~corrigido[14];
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
