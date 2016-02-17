class ProductsController < ApplicationController
  before_action :ensure_logged_in , only:[:edit, :destroy]
  before_action :load_product, only:[:show, :edit, :update, :destroy]


  def index
    @products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Product.all
    end


    @products = @products.order('products.created_at DESC').page(params[:page])

    # if request.xhr?
    #   render @products
    # end

    respond_to do |format|
      format.html
      format.js
    end



  end

  def show
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to products_url
      else
        render :new
      end
  end

  def update
      if @product.update_attributes(product_params)
        redirect_to product_path(@product)
      else
        render :edit
      end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :url)
  end

  def load_product
    @product = Product.find(params[:id])
  end

end
