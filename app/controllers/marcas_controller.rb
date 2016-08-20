class MarcasController < ApplicationController
  before_action :set_marcas, only: [:show, :edit, :update, :destroy]

  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = Marcas.all
  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
  end

  # GET /marcas/new
  def new
    @marcas = Marcas.new
  end

  # GET /marcas/1/edit
  def edit
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marcas = Marcas.new(marcas_params)

    respond_to do |format|
      if @marcas.save
        format.html { redirect_to marcas_index_url, notice: 'Marcas was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @marcas.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marcas/1
  # PATCH/PUT /marcas/1.json
  def update
    respond_to do |format|
      if @marcas.update(marcas_params)
        format.html { redirect_to marcas_index_url, notice: 'Marcas was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @marcas.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    @marcas.destroy
    respond_to do |format|
      format.html { redirect_to marcas_index_url, notice: 'Marcas was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marcas
      @marcas = Marcas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marcas_params
      params.require(:marcas).permit(:nome)
    end
end
