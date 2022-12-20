class SellerController < ApplicationController
    before_action :must_seller_admin, only: %i[ top_seller ]
    
    def top_seller
    end

    def gen_top_seller
        if params[:start_date] >= params[:stop_date]
            redirect_to top_seller_path, alert: "Start date must less than stop date."
        else 
            redirect_to top_seller_path, notice: "Your dates have sumitted."
        end

        if params[:sort_by] == "quantity"
            max_c = 0
            count_item = 0
            max_id = 0
            inventory_all = Inventory.all.collect{ |u| [u.id, u.item_id] 
                count_item = Inventory.where(item_id: u.item_id).count
                if max_c < count_item
                    max_c = count_item
                    max_id = u.item_id
                end
            }

            user_top_id = Item.where(id: max_id).first.user_id
            session[:user_top_name] = User.where(id: user_top_id).first.name
            
        elsif params[:sort_by] == "top_seller"
        
        end
    end

    private
        def is_seller_admin
            if session[:user_type] == 0 or session[:user_type] == 1
                return true
            else 
                return false
            end
        end

        def must_seller_admin
            if is_seller_admin
                return true
            else
                redirect_to main_path, alert: 'You must be admin or seller for accessing this page.'
            end
        end
end
