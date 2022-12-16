class ScaffoldController < ApplicationController
    before_action :must_admin, only: %i[ user_scaffold item_scaffold ]

    def user_scaffold
        
    end

    def create_user
        new_email = params[:new_email]
        new_name = params[:new_name]
        new_password = params[:new_password]
        new_user_type = params[:new_user_type].to_i
        lock_version = params[:lock_version].to_i
        a = User.new
        a.email = new_email
        a.name = new_name
        a.password = new_password
        a.user_type = new_user_type 
        a.lock_version = lock_version
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
        b = Item.new(name: params[:new_item_name], category: params[:new_item_category], enable: params[:new_item_enable], user_id: params[:new_user_id], lock_version: params[:lock_version])

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
