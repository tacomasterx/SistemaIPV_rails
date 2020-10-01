json.extract! sale, :id, :amount, :discount, :created_at, :updated_at
json.url sale_url(sale, format: :json)
