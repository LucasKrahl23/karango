class CombustiveisController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_combustivel, only: [:edit, :update, :destroy]

  # GET /combustiveis
  # GET /combustiveis.json
  def index
    @combustiveis = Combustivel.all
  end

  # GET /combustiveis/new
  def new
    @combustivel = Combustivel.new
  end

  # GET /combustiveis/1/edit
  def edit
  end

  # POST /combustiveis
  # POST /combustiveis.json
  def create
    @combustivel = Combustivel.new(combustivel_params)

    respond_to do |format|
      if @combustivel.save
        format.html { redirect_to combustiveis_url, notice: 'Combustível criado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @combustivel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combustiveis/1
  # PATCH/PUT /combustiveis/1.json
  def update
    respond_to do |format|
      if @combustivel.update(combustivel_params)
        format.html { redirect_to combustiveis_url, notice: 'Combustível editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @combustivel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combustiveis/1
  # DELETE /combustiveis/1.json
  def destroy
    @combustivel.destroy
    respond_to do |format|
      format.html { redirect_to combustiveis_url, notice: 'Combustível excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combustivel
      @combustivel = Combustivel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combustivel_params
      params.require(:combustivel).permit(:nome)
    end
end
