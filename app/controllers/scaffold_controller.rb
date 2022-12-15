class ScaffoldController < ApplicationController
    before_action :must_admin, only: %i[ user_scaffold item_scaffold ]

    def user_scaffold
        
    end

    def create_user
        new_email = params[:new_email]
        new_name = params[:new_name]
        new_password = params[:new_password]
        new_user_type = params[:new_user_type].to_i
        a = User.new
        a.email = new_email
        a.name = new_name
        a.password = new_password
        a.user_type = new_user_type
        a.save
        redirect_to main_path, notice: "You have created user!"
    end

    def item_scaffold
        
    end

    def create_item
        # new_item_name = params[:new_item_name]
        # new_item_category = params[:new_item_category]
        # new_item_enable = params[:new_item_enable]
        # new_user_id = params[:new_user_id]
        b = Item.new
        b.name = params[:new_item_name]
        b.category = params[:new_item_category]
        b.enable = params[:new_item_enable]
        b.user_id = params[:new_user_id]

        if b.save
            redirect_to main_path, notice: "You have created item."
        else 
            redirect_to item_scaffold_path, alert: "Your creation is failed."
        end

        
        
    end

    private
        def is_admin
            return session[:user_type] == 0
        end

        def must_admin
            if is_admin
                return true
            else
                redirect_to main_path, alert: 'You must be an admin for accessing this page.'
            end
        end
    
end
