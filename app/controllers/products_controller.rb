class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1                                     "profit"=>20   ==  profit: 20, price_2: 23
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    uva = "jamón"
    @product = Product.new({ "name"=>uva,"profit"=>20, "price_2"=>0.0, "price_3"=>0.0, "price_4"=>0.0, "price_5"=>0.0, "brand"=>"Paper mate"})
  end

  # GET /products/1/edit
  def edit
  end

  # def clone
  #
  #   @clon = Product.new({ "name"=>@product.name,"profit"=>20, "price_2"=>0.0, "price_3"=>0.0, "price_4"=>0.0, "price_5"=>0.0, "brand"=>"Paper mate"})
  # end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def inflate
    respond_to do |format|
      if Product.update_all('price_5 = price_5+1')
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :index, status: :ok, location: products_path }
      else
        format.html { render :index }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :unit, :quantity, :weight, :price_unit, :profit, :price_2, :price_3, :price_4, :price_5, :brand, :sku, :product_type_id)
    end
end
