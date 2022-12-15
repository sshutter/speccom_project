class MyInventController < ApplicationController
    before_action :must_seller_admin, only: %i[ my_inventory ]

    def my_inventory
        a = Marketplace.where(item_id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
        if a.blank? == false
            if params[:change] == "-1"
                a.stock -= 1
                a.save
                redirect_to my_inventory_path
            elsif params[:change] == "+1"
                a.stock += 1
                a.save
                redirect_to my_inventory_path
            end
        end

        if params[:is_delete] 
            a = Marketplace.where(item_id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
            b = Item.where(id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
            a.destroy
            b.destroy
            redirect_to my_inventory_path
        end
    end

    def delete_item
        a = Marketplace.where(item_id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
        b = Item.where(id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
        if a.blank? == false and b.blank? == false
            redirect_to my_inventory_path
        end
    end

    def my_inventory2
        item_id2 = params[:item_id2]

        if params[:edit_item] != nil 
            a = Marketplace.where(item_id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
            if params[:edit_item] != nil
                a.stock = params[:edit_item].to_i
                a.save
                redirect_to my_inventory_path
            end
  
            if a.stock < 0
                a.stock = 0
                a.save
                redirect_to my_inventory_path, alert: "Item quantity must be more than 0."
            end
        end

        if params[:change_enable] != nil
            b = Item.where(id: params[:item_id2].to_i, user_id: params[:user_id2].to_i).first
            if b != nil
                pp "gggggg"
            else
                pp "hhhhh"
            end
            b.enable = params[:change_enable]
            b.save
            redirect_to my_inventory_path
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
