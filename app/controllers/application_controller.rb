class ApplicationController < ActionController::Base
    #before_action :configure_permitted_parameters, if: :devise_controller?
    #helper_method :current_user, :logged_in?
    #before_action :authenticate_user!

    

    #def current_user
        #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    #end

    # def logged_in?
    #     !!current_user
    # end

    def require_user
        unless user_signed_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end


=begin    

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
          end
      end
=end      
end
