class PerfisusuariosController < ApplicationController
  before_action :set_perfisusuario, only: [:show, :edit, :update, :destroy]

  # GET /perfisusuarios
  # GET /perfisusuarios.json
  def index
    @perfisusuarios = Perfisusuario.all
  end

  # GET /perfisusuarios/1
  # GET /perfisusuarios/1.json
  def show
  end

  # GET /perfisusuarios/new
  def new
    @perfisusuario = Perfisusuario.new
  end

  # GET /perfisusuarios/1/edit
  def edit
  end

  # POST /perfisusuarios
  # POST /perfisusuarios.json
  def create
    @perfisusuario = Perfisusuario.new(perfisusuario_params)

    respond_to do |format|
      if @perfisusuario.save
        format.html { redirect_to perfisusuarios_url, notice: 'Perfisusuario was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @perfisusuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfisusuarios/1
  # PATCH/PUT /perfisusuarios/1.json
  def update
    respond_to do |format|
      if @perfisusuario.update(perfisusuario_params)
        format.html { redirect_to perfisusuarios_url, notice: 'Perfisusuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @perfisusuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfisusuarios/1
  # DELETE /perfisusuarios/1.json
  def destroy
    @perfisusuario.destroy
    respond_to do |format|
      format.html { redirect_to perfisusuarios_url, notice: 'Perfisusuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfisusuario
      @perfisusuario = Perfisusuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfisusuario_params
      params.require(:perfisusuario).permit(:nome, :admin_flag)
    end
end
