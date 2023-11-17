class RegistrationController < ApplicationController
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    #изменение данных
    def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
    end

    protected
    #ввод данных
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
    
    def update_resource (resource,params)
        return super if params["password"]&.present?
    
        resource.update_without_password(params.except "current_password")
    end

    def index
    end
end
