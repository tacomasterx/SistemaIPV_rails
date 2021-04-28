require 'rails_helper'

RSpec.describe "TestApis", type: :request do
  describe "GET test_apis/index" do
    it 'returns http response'do
      get "/test_apis"
      expect(response).to have_http_status(:success)  #have_http_status(:success)
    end
  end

  describe "GET test_apis/show" do
    it 'returns http response'do
      test_api = TestApi.create!(	fakeId:1, title: "enim quo cumque", body: "ut voluptatum aliquid illo tenetur nemo sequi ...", userId: 4	)
      get "/test_apis/#{test_api.id}"
      expect(response).to have_http_status(:success) 
    end
  end
end
