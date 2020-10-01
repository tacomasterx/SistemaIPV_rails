require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get transactions_update_url
    assert_response :success
  end

end
