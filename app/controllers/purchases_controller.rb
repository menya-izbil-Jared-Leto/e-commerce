class PurchasesController < ApplicationController
    def index
        @purchases = current_user.purchases
    end
    
      def show
        @purchase = Purchase.find(params[:id])
    end
end
