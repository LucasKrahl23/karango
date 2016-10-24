class RelatoriosController < ApplicationController
  skip_before_filter :verify_authenticity_token
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

  def info
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @veiculo_relatorio = nil
    if !params[:veiculo].nil? 
      @veiculo_relatorio = params[:veiculo]
      @gastodia = 0
      @gastokm = 0
      @rodado = 0
      @kmdia = 0
      @gastototal = 0

      #informações de valores
      querysql = "select sum(totalgasto) total from ("
      querysql += " select round(sum(precototal),2) as totalgasto from abastecimentos where veiculo_id = "+ @veiculo_relatorio +" and abastecimento_dt > current_date - interval '90' day"
      querysql += " union"
      querysql += " select round(sum(valor),2) as totalgasto from despesas where veiculo_id = "+ @veiculo_relatorio +" and despesa_dt > current_date - interval '90' day "
      querysql += " union"
      querysql += " select round(sum(valor),2) as totalgasto from manutencoes where veiculo_id = "+ @veiculo_relatorio +" and manutencao_dt > current_date - interval '90' day "
      querysql += " ) as tmp"

      result = consultaSQL querysql
      result.each do |row|
        if !row['total'].nil?
          @gastototal = row['total']
          @gastodia = @gastototal.to_d / 90
        end
      end
      #informações de distancia
      querysql = "select min(odometro) as inicio, max(odometro) as fim from ("
      querysql += " select odometro from abastecimentos where veiculo_id = "+ @veiculo_relatorio +" and abastecimento_dt > current_date - interval '90' day"
      querysql += " union"
      querysql += " select odometro from manutencoes where veiculo_id = "+ @veiculo_relatorio +" and manutencao_dt > current_date - interval '90' day "
      querysql += " ) as tmp"

      result = consultaSQL querysql
      result.each do |row|
        if !row['inicio'].nil?
          @rodado = row['fim'] - row['inicio']
          @kmdia = @rodado / 90
          @gastokm = @gastototal.to_d / @rodado.to_d
        end
      end

    end
  end

  def consultaSQL sql
    @connection = ActiveRecord::Base.connection
    @connection.exec_query(sql)
  end 
end
