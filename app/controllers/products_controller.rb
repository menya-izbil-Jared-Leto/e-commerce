class ProductsController < ApplicationController
  before_action :check, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def detail
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params.merge(user_id: current_user.id))
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    end
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end 
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end
  
  def check
    if current_user.role == 'buyer' or @product.user_id == current_user.id
      redirect_to root_path, alert: "Успокойся, малой :)"
    end
  end
  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :rating, :avatar)
  end

end
  
