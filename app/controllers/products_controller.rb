class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def create
        @product = Product.new(product_params)
        @product.user = current_user
        authorize @product
        if @product.save
            redirect_to @product
        else
            render :new
        end
    end
    
    def update
        @product = Product.find(params[:id])
        authorize @product
        if @product.update(product_params)
            redirect_to @product
        else
            render :edit
        end
    end
end
