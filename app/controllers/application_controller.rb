class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception
  	def after_sign_in_path_for(resource)
      veiculos_url
	end
	def after_sign_out_path_for(resource)
      new_usuario_session_path
	end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
  end
end
