class DespesasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_despesa, only: [:edit, :update, :destroy]

  # GET /despesas
  # GET /despesas.json
  def index
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @despesas = Despesa.where(:veiculo_id => @veiculos)
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
  end

  # GET /despesas/1/edit
  def edit
  end

  # POST /despesas
  # POST /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to despesas_url, notice: 'Despesa criada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update
    respond_to do |format|
      if @despesa.update(despesa_params)
        format.html { redirect_to despesas_url, notice: 'Despesa editada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    @despesa.destroy
    respond_to do |format|
      format.html { redirect_to despesas_url, notice: 'Despesa excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def despesa_params
      params.require(:despesa).permit(:descricao, :despesa_dt, :valor, :formaspagamento_id, :veiculo_id, :obs)
    end
end
