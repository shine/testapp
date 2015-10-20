class ProductsController < ApplicationController
  def index
    @products = Product.includes(:reviews)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    @product = Product.new(product_params)
    @product.save!

    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end  
end