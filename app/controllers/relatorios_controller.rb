class RelatoriosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
  end

  def abastecimentos
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @veiculo_relatorio = nil
    if params[:veiculo].to_i > 0
      @veiculo_relatorio = params[:veiculo]
      @combustivel_nome = []
      @combustivel_qtd = []

      querysql = "select count(c.nome) as qtd, c.nome as nome from combustiveis c join abastecimentos a on c.id = a.combustivel_id where veiculo_id = "+ @veiculo_relatorio +" group by 2"

      result = consultaSQL querysql
      result.each do |row|
        if !row['qtd'].nil?
          @combustivel_qtd.push(row['qtd'])
          @combustivel_nome.push(row['nome'])
        end
      end

      @odometro = []
      @abastecimento_dt = []

      querysql = "select odometro, abastecimento_dt from abastecimentos where veiculo_id = "+ @veiculo_relatorio

      result = consultaSQL querysql
      result.each do |row|
        if !row['odometro'].nil?
          @odometro.push(row['odometro'])
          @abastecimento_dt.push(row['abastecimento_dt'])
        end
      end

      @precolitro = []
      @precolitro_dt = []

      querysql = "select precolitro, abastecimento_dt from abastecimentos where veiculo_id = "+ @veiculo_relatorio

      result = consultaSQL querysql
      result.each do |row|
        if !row['precolitro'].nil?
          @precolitro.push(row['precolitro'])
          @precolitro_dt.push(row['abastecimento_dt'])
        end
      end

      

      @litros = []
      @litros_dt = []

      querysql = "select (precototal / precolitro) as qtd, abastecimento_dt from abastecimentos where veiculo_id = "+ @veiculo_relatorio

      result = consultaSQL querysql
      result.each do |row|
        if !row['qtd'].nil?
          @litros.push(row['qtd'])
          @litros_dt.push(row['abastecimento_dt'])
        end
      end
    end
  end

  def gastos
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @veiculo_relatorio = nil
    if params[:veiculo].to_i > 0
      @veiculo_relatorio = params[:veiculo]
      @total_abastecimentos = 0
      @total_despesas = 0
      @total_impostos = 0
      @total_manutencoes = 0
      #@dtinicio = params[:dtinicio]
      #@dtfim = params[:dtfim]

      querysql = "select sum(precototal) as total from abastecimentos where veiculo_id = "+ @veiculo_relatorio +" and abastecimento_dt between '2015-01-01' and '2016-10-25'"

      result = consultaSQL querysql
      result.each do |row|
        if !row['total'].nil?
          @total_abastecimentos = row['total']
        end
      end

      querysql = "select sum(valor) as total from despesas where veiculo_id = "+ @veiculo_relatorio +" and despesa_dt between '2015-01-01' and '2016-10-25'"

      result = consultaSQL querysql
      result.each do |row|
        if !row['total'].nil?
          @total_despesas = row['total']
        end
      end

      querysql = "select sum(valor) as total from impostos where veiculo_id = "+ @veiculo_relatorio +" and vencimento_dt between '2015-01-01' and '2016-10-25'"

      result = consultaSQL querysql
      result.each do |row|
        if !row['total'].nil?
          @total_impostos = row['total']
        end
      end

      querysql = "select sum(valor) as total from manutencoes where veiculo_id = "+ @veiculo_relatorio +" and manutencao_dt between '2015-01-01' and '2016-10-25'"

      result = consultaSQL querysql
      result.each do |row|
        if !row['total'].nil?
          @total_manutencoes = row['total']
        end
      end
    end
  end

  def desempenho
  	@veiculos = Veiculo.where(usuario_id: current_usuario)
  	@veiculo_relatorio = nil
  	if params[:veiculo].to_i > 0
  		puts params[:veiculo]
  		@veiculo_relatorio = params[:veiculo]
  	end
  end

  def info
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @veiculo_relatorio = nil
    if params[:veiculo].to_i > 0
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
