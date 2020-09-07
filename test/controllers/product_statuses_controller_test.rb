require 'test_helper'

class ProductStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_status = product_statuses(:one)
  end

  test "should get index" do
    get product_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_product_status_url
    assert_response :success
  end

  test "should create product_status" do
    assert_difference('ProductStatus.count') do
      post product_statuses_url, params: { product_status: { managable: @product_status.managable, name: @product_status.name } }
    end

    assert_redirected_to product_status_url(ProductStatus.last)
  end

  test "should show product_status" do
    get product_status_url(@product_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_status_url(@product_status)
    assert_response :success
  end

  test "should update product_status" do
    patch product_status_url(@product_status), params: { product_status: { managable: @product_status.managable, name: @product_status.name } }
    assert_redirected_to product_status_url(@product_status)
  end

  test "should destroy product_status" do
    assert_difference('ProductStatus.count', -1) do
      delete product_status_url(@product_status)
    end

    assert_redirected_to product_statuses_url
  end
end
