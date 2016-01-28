class ProductsController < ApplicationController
  def index
    @proudcts = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
      if @proudct.save
        redirect_to products_url
      else
        render :new
      end
  end

  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        redirect_to product_path(@product)
      else
        render :edit
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :products_path
  end

  private

  def picture_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
