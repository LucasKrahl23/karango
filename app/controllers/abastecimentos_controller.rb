class AbastecimentosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_abastecimento, only: [:edit, :update, :destroy]

  # GET /abastecimentos
  # GET /abastecimentos.json
  def index
    @veiculos = Veiculo.where(usuario_id: current_usuario)
    @abastecimentos = Abastecimento.where(:veiculo_id => @veiculos)
  end
  
  # GET /abastecimentos/new
  def new
    @abastecimento = Abastecimento.new
  end

  # GET /abastecimentos/1/edit
  def edit
  end

  # POST /abastecimentos
  # POST /abastecimentos.json
  def create
    @abastecimento = Abastecimento.new(abastecimento_params)

    respond_to do |format|
      if @abastecimento.save
        format.html { redirect_to abastecimentos_url, notice: 'Abastecimento criado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abastecimentos/1
  # PATCH/PUT /abastecimentos/1.json
  def update
    respond_to do |format|
      if @abastecimento.update(abastecimento_params)
        format.html { redirect_to abastecimentos_url, notice: 'Abastecimento editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abastecimentos/1
  # DELETE /abastecimentos/1.json
  def destroy
    @abastecimento.destroy
    respond_to do |format|
      format.html { redirect_to abastecimentos_url, notice: 'Abastecimento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abastecimento
      @abastecimento = Abastecimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abastecimento_params
      params.require(:abastecimento).permit(:abastecimento_dt, :odometro, :precolitro, :precototal, :obs, :veiculo_id, :completou_flag, :combustivel_id, :formaspagamento_id)
    end
end
