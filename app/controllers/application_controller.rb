class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters,if: :devise_controller?
    before_action :authenticate_user!



    private
    def after_sign_out_path_for(resource)
        '/users/sign_in'
    end
    def after_sign_in_path_for(resource)
        '/select'
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:user_id])
        devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
        devise_parameter_sanitizer.permit(:sign_up,keys:[:user_name])

        devise_parameter_sanitizer.permit(:sign_in,keys:[:user_id])

    end

end
