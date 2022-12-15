class MarketController < ApplicationController
    before_action :must_buyer_admin

    def my_market
        @marketplaces = Marketplace.search(params[:search])
        
    end


    def my_market2
        if params[:buy_qty] != nil 
            item_id2 = params[:item_id2]
            a = Marketplace.where(item_id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
            a.stock -= params[:buy_qty].to_i
            a.save
            b = Inventory.new
            b.user_id = session[:user_id].to_i
            b.price = a.price
            b.qty = params[:buy_qty]
            b.item_id = params[:item_id2]
            b.save
            
            redirect_to my_market_path, notice: "Your purchase is successful."
        end
    end


    private

        def check_buyer_admin
            if session[:user_type] == 0 or session[:user_type] == 2
                return true
            else
                return false
            end
        end

        def must_buyer_admin
            if check_buyer_admin
                return true
            else 
                redirect_to main_path, alert: 'You must be admin or buyer for accessing this page.'
            end
        end
end
