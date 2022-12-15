class ApplicationController < ActionController::Base
    before_action :my_debug
    private
        def is_login?
            return session[:logged_in] == true
        end

        def must_logged_in
            if is_login?
                return true
            else
                redirect_to login_path, alert: 'You must login before accessing this page.'
            end
        end
        
        def my_debug
            pp '----------------------------------------------------'
            pp session.to_h
        end
end
