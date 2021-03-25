json.extract! test_api, :id, :fakeId, :title, :body, :userId, :created_at, :updated_at
json.url test_api_url(test_api, format: :json)
