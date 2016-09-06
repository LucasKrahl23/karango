class TiposveiculosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_tiposveiculo, only: [:edit, :update, :destroy]

  # GET /tiposveiculos
  # GET /tiposveiculos.json
  def index
    @tiposveiculos = Tiposveiculo.all
  end

  # GET /tiposveiculos/new
  def new
    @tiposveiculo = Tiposveiculo.new
  end

  # GET /tiposveiculos/1/edit
  def edit
  end

  # POST /tiposveiculos
  # POST /tiposveiculos.json
  def create
    @tiposveiculo = Tiposveiculo.new(tiposveiculo_params)

    respond_to do |format|
      if @tiposveiculo.save
        format.html { redirect_to tiposveiculos_url, notice: 'Tipo de Veículo criado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @tiposveiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiposveiculos/1
  # PATCH/PUT /tiposveiculos/1.json
  def update
    respond_to do |format|
      if @tiposveiculo.update(tiposveiculo_params)
        format.html { redirect_to tiposveiculos_url, notice: 'Tipo de Veículo editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @tiposveiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiposveiculos/1
  # DELETE /tiposveiculos/1.json
  def destroy
    @tiposveiculo.destroy
    respond_to do |format|
      format.html { redirect_to tiposveiculos_url, notice: 'Tipo de Veículo excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiposveiculo
      @tiposveiculo = Tiposveiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiposveiculo_params
      params.require(:tiposveiculo).permit(:nome)
    end
end
