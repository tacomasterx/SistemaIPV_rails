class ProductSubtypesController < ApplicationController
  before_action :set_product_subtype, only: [:show, :edit, :update, :destroy]

  # GET /product_subtypes
  # GET /product_subtypes.json
  def index
    @product_subtypes = ProductSubtype.all
  end

  # GET /product_subtypes/1
  # GET /product_subtypes/1.json
  def show
  end

  # GET /product_subtypes/new
  def new
    @product_subtype = ProductSubtype.new
  end

  # GET /product_subtypes/1/edit
  def edit
  end

  # POST /product_subtypes
  # POST /product_subtypes.json
  def create
    @product_subtype = ProductSubtype.new(product_subtype_params)

    respond_to do |format|
      if @product_subtype.save
        format.html { redirect_to @product_subtype, notice: 'Product subtype was successfully created.' }
        format.json { render :show, status: :created, location: @product_subtype }
      else
        format.html { render :new }
        format.json { render json: @product_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_subtypes/1
  # PATCH/PUT /product_subtypes/1.json
  def update
    respond_to do |format|
      if @product_subtype.update(product_subtype_params)
        format.html { redirect_to @product_subtype, notice: 'Product subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_subtype }
      else
        format.html { render :edit }
        format.json { render json: @product_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_subtypes/1
  # DELETE /product_subtypes/1.json
  def destroy
    @product_subtype.destroy
    respond_to do |format|
      format.html { redirect_to product_subtypes_url, notice: 'Product subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_subtype
      @product_subtype = ProductSubtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_subtype_params
      params.require(:product_subtype).permit(:name, :product_type_id)
    end
end
