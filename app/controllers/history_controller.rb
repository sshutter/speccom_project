class HistoryController < ApplicationController
    before_action :must_buyer_admin, only: %i[ purchase_history ]
    before_action :must_seller_admin, only: %i[ sale_history ]

    def purchase_history
        @invents = Inventory.all
    end

    def sale_history
        @invents = Inventory.all
    end

    private
        def is_buyer_admin
            if session[:user_type] == 0 or session[:user_type] == 2
                return true
            else 
                return false
            end
        end

        def must_buyer_admin
            if is_buyer_admin
                return true
            else
                redirect_to main_path, alert: 'You must be admin or buyer for accessing this page.'
            end
        end

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
