class PrimaryController < ApplicationController

    def login
    end
  
    def create
      u = User.where(email: params[:email]).first
      if u && u.authenticate(params[:password])
        redirect_to main_path
        session[:logged_in] = true
        session[:user_id] = u.id
        session[:email] = u.email
        session[:name] = u.name
        session[:user_type] = u.user_type
      else
        redirect_to login_path, alert: 'Wrong Email or Password'
      end
    end

    def destroy
    end

    def log_out
      
      session[:logged_in] = nil
      session[:user_id] = nil
      session[:email] = nil
      session[:name] = nil
      session[:user_type] = nil
      reset_session
      redirect_to login_path, notice: "You have logged out!"
    end

    
end
