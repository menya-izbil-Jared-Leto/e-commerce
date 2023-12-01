class UsersController < ApplicationController
    def new_product
        @product = Product.new
    end
end
