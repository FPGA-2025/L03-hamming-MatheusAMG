module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo 
  output reg [10:0] saida
);

reg [3:0] posicao_erro;
reg [14:0] corrigido;

// se bit 14, 13, 11 ou 7 ativo, há erro
always @(*) begin
  if (entrada[14] || entrada[13] || entrada[11] || entrada[7]) begin

    posicao_erro = {entrada[14], entrada[13], entrada[11], entrada[7]};
    corrigido = entrada ^ (1 << posicao_erro); // Inverter bit errado
  end
end


// saida apenas os bits de dados
always @(*) begin
  saida = {corrigido[12], corrigido[10:8], corrigido[6:0]}
end

endmodule
