class TestApisController < ApplicationController
  before_action :set_test_api, only: [:show, :edit, :update, :destroy]

  # GET /test_apis
  # GET /test_apis.json
  def index
    @test_apis = TestApi.all
  end

  # GET /test_apis/1
  # GET /test_apis/1.json
  def show
  end

  # GET /test_apis/new
  def new
    @test_api = TestApi.new
  end

  # GET /test_apis/1/edit
  def edit
  end

  # POST /test_apis
  # POST /test_apis.json
  def create
    @test_api = TestApi.new(test_api_params)

    respond_to do |format|
      if @test_api.save
        format.html { redirect_to @test_api, notice: 'Test api was successfully created.' }
        #format.json { render :show, status: :created, location: @test_api }
        format.js
      else
        format.html { render :new }
        #format.json { render json: @test_api.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /test_apis/1
  # PATCH/PUT /test_apis/1.json
  def update
    respond_to do |format|
      if @test_api.update(test_api_params)
        format.html { redirect_to @test_api, notice: 'Test api was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_api }
      else
        format.html { render :edit }
        format.json { render json: @test_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_apis/1
  # DELETE /test_apis/1.json
  def destroy
    @test_api.destroy
    respond_to do |format|
      format.html { redirect_to test_apis_url, notice: 'Test api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_api
      @test_api = TestApi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_api_params
      params.require(:test_api).permit(:fakeId, :title, :body, :userId)
    end
end
