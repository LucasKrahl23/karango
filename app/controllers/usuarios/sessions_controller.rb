class Usuarios::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
     respond_to do |format|
      format.html { redirect_to root_path, notice: 'Logado com sucesso.' }
      format.json { head :no_content }
    end
   end

  # POST /resource/sign_in
  # def create
  #   super
  #   respond_to do |format|
  #    format.html { redirect_to veiculos_url, notice: 'Logado com sucesso.' }
  #    format.json { head :no_content }
  #  end
  # end

  # DELETE /resource/sign_out
   def destroy
     #super
     respond_to do |format|
      format.html { redirect_to new_usuario_session_path, notice: 'Deslogado com sucesso.' }
      format.json { head :no_content }
    end
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
