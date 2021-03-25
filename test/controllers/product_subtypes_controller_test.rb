require 'test_helper'

class ProductSubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_subtype = product_subtypes(:one)
  end

  test "should get index" do
    get product_subtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_product_subtype_url
    assert_response :success
  end

  test "should create product_subtype" do
    assert_difference('ProductSubtype.count') do
      post product_subtypes_url, params: { product_subtype: { name: @product_subtype.name, product_type_id: @product_subtype.product_type_id } }
    end

    assert_redirected_to product_subtype_url(ProductSubtype.last)
  end

  test "should show product_subtype" do
    get product_subtype_url(@product_subtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_subtype_url(@product_subtype)
    assert_response :success
  end

  test "should update product_subtype" do
    patch product_subtype_url(@product_subtype), params: { product_subtype: { name: @product_subtype.name, product_type_id: @product_subtype.product_type_id } }
    assert_redirected_to product_subtype_url(@product_subtype)
  end

  test "should destroy product_subtype" do
    assert_difference('ProductSubtype.count', -1) do
      delete product_subtype_url(@product_subtype)
    end

    assert_redirected_to product_subtypes_url
  end
end
