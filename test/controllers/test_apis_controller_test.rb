require 'test_helper'

class TestApisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_api = test_apis(:one)
  end

  test "should get index" do
    get test_apis_url
    assert_response :success
  end

  test "should get new" do
    get new_test_api_url
    assert_response :success
  end

  test "should create test_api" do
    assert_difference('TestApi.count') do
      post test_apis_url, params: { test_api: { body: @test_api.body, fakeId: @test_api.fakeId, title: @test_api.title, userId: @test_api.userId } }
    end

    assert_redirected_to test_api_url(TestApi.last)
  end

  test "should show test_api" do
    get test_api_url(@test_api)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_api_url(@test_api)
    assert_response :success
  end

  test "should update test_api" do
    patch test_api_url(@test_api), params: { test_api: { body: @test_api.body, fakeId: @test_api.fakeId, title: @test_api.title, userId: @test_api.userId } }
    assert_redirected_to test_api_url(@test_api)
  end

  test "should destroy test_api" do
    assert_difference('TestApi.count', -1) do
      delete test_api_url(@test_api)
    end

    assert_redirected_to test_apis_url
  end
end
