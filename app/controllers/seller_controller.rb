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
                if params[:start_date] <= u.created_at and u.created_at < params[:stop_date]
                    count_item = Inventory.where(item_id: u.item_id).count
                    if max_c < count_item
                        max_c = count_item
                        max_id = u.item_id
                    end
                end
            }

            user_top_id = Marketplace.where(item_id: max_id).first.user_id
            # top_item = Item.where(id: user_top_id).first.user_id
            session[:user_top_name] = User.where(id: user_top_id).first.name
            
        elsif params[:sort_by] == "total_price"
            this_price = 0
            max_price = 0
            max_price_id = 0
            dic = {}
            inventory_all = Inventory.all.collect{ |u| [u.item_id, u.qty]
                if params[:start_date] <= u.created_at and u.created_at < params[:stop_date]
                    this_price = u.qty.to_i * u.price.to_i
                    if dic.has_key?(u.item_id)
                        dic[u.item_id] += this_price
                    else 
                        dic = dic.merge({u.item_id=>this_price})
                    end
                end
                # if max_price < this_price
                #     max_price = this_price
                #     max_price_id = u.item_id
                # end
            }

            dic = dic.sort_by{ |k,v| v }
            maxprice = dic.last.last
            max_price_id = dic.last.first

            user_top_id = Marketplace.where(item_id: max_price_id).first.user_id
            # top_item = Item.where(id: user_top_id).first.user_id
            session[:user_top_name] = User.where(id: user_top_id).first.name
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
