class MainController < ApplicationController
    before_action :must_logged_in
    before_action :must_pass, only: %i[ new_password ]

    def show_main
       
    end

    def profile
        # @email = session[:email]
        # @name = session[:name]
        @name = session[:name]
        @email = session[:email]
        if session[:user_type] == 0
            @type = "Admin"
        elsif session[:user_type] == 1
            @type = "Seller"
        elsif session[:user_type] == 2
            @type = "Buyer"
        end

       
        # @password = @user.password
    end

   

    def old_password
        
    end

    def authen_password
        old_password = params[:old_password]
        user = User.where(email: session[:email]).first
        if user.authenticate(params[:old_password])
            redirect_to new_password_path
            session[:pass_old] = true
        else 
            redirect_to old_password_path, alert: "Your password is wrong."
        end
    end

    def new_password
        
    end

    def save_new_pass
        user = User.where(email: session[:email]).first
        new_password1 = params[:new_password1]
        new_password2 = params[:new_password2]
        if new_password1 == new_password2
            user.password = new_password1
            user.save
            redirect_to profile_path, notice: "Your password have change."
        else 
            redirect_to new_password_path, alert: "Password don't match."
        end
    end

    private
        def pass_old_password
            return session[:pass_old] == true
        end

        def must_pass
            if pass_old_password
                return true
            else
                redirect_to old_password_path, alert: "You must write your old password fist."
            end
        end
end
