class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_active_storage_url_options

    private
  
    def set_active_storage_url_options
      ActiveStorage::Current.url_options = { host: request.base_url }
    end
    
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :username, :gender, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :username, :gender, :image])
    end
    end
