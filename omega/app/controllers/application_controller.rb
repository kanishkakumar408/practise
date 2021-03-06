class ApplicationController < ActionController::Base
  before_action :authenticate_user!	

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
    def configure_permitted_parameters
  	  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :Date_of_birth, :location, :password, :password_confirmation])
  	  devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :location, :password, :password_confirmation])
  	  devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password])
    end
  
end

