class AllProductsController < ApplicationController
    def index
        @products = Product.all
    end
end
