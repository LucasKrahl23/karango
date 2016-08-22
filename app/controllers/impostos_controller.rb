class ImpostosController < ApplicationController
  before_action :set_imposto, only: [:show, :edit, :update, :destroy]

  # GET /impostos
  # GET /impostos.json
  def index
    @impostos = Imposto.all
  end

  # GET /impostos/1
  # GET /impostos/1.json
  def show
  end

  # GET /impostos/new
  def new
    @imposto = Imposto.new
  end

  # GET /impostos/1/edit
  def edit
  end

  # POST /impostos
  # POST /impostos.json
  def create
    @imposto = Imposto.new(imposto_params)

    respond_to do |format|
      if @imposto.save
        format.html { redirect_to impostos_url, notice: 'Imposto was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @imposto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impostos/1
  # PATCH/PUT /impostos/1.json
  def update
    respond_to do |format|
      if @imposto.update(imposto_params)
        format.html { redirect_to impostos_url, notice: 'Imposto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @imposto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impostos/1
  # DELETE /impostos/1.json
  def destroy
    @imposto.destroy
    respond_to do |format|
      format.html { redirect_to impostos_url, notice: 'Imposto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imposto
      @imposto = Imposto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imposto_params
      params.require(:imposto).permit(:descricao, :valor, :vencimento_dt, :obs, :pago_flag, :formaspagamento_id, :veiculo_id)
    end
end
