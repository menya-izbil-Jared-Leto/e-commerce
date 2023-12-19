class CartsController < ApplicationController
    def index
        @cart_products = current_user.cart_products
    end

    def create
        @cart = current_user.carts.build(product_id: params[:product_id])
        if @cart.save
            flash[:notice] = 'Product was successfully added to cart.'
            redirect_to all_products_path(params[:product_id]), notice: 'Product was successfully added to cart.'
        else
            redirect_to product_path(params[:product_id]), alert: 'There was an error adding the product to the cart.'
        end
    end

    def buy
        current_user.carts.each do |cart|
          Purchase.create(user: current_user, product: cart.product)
          cart.product.update(sold: true) # помечаем продукт как проданный
          cart.destroy
        end
        # обработка покупки
    end

    def destroy
        @cart = Cart.find_by(user_id: current_user.id, product_id: params[:id])
        @cart.destroy if @cart
        # обработка удаления товара из корзины
    end
end
