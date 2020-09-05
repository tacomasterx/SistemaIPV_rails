require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { brand: @product.brand, description: @product.description, name: @product.name, price_2: @product.price_2, price_3: @product.price_3, price_4: @product.price_4, price_5: @product.price_5, price_unit: @product.price_unit, profit: @product.profit, quantity: @product.quantity, sku: @product.sku, unit: @product.unit, weight: @product.weight } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { brand: @product.brand, description: @product.description, name: @product.name, price_2: @product.price_2, price_3: @product.price_3, price_4: @product.price_4, price_5: @product.price_5, price_unit: @product.price_unit, profit: @product.profit, quantity: @product.quantity, sku: @product.sku, unit: @product.unit, weight: @product.weight } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
