class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    private

    def verify_is_admin
        if current_user.nil?
            redirect_to root_path, alert: 'Restricted!' 
        else 
            redirect_to root_path, alert: 'Restricted!' unless current_user.admin? 
        end
    end
end
