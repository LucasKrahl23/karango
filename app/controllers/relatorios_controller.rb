class RelatoriosController < ApplicationController
  def index
  end

  def desempenho
  	@veiculos = Veiculo.where(usuario_id: current_usuario)
  	@veiculo_relatorio = nil
  	if !params[:veiculo].nil? 
  		puts params[:veiculo]
  		@veiculo_relatorio = params[:veiculo]
  	end
  end
end
