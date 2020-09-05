json.extract! product, :id, :name, :description, :unit, :quantity, :weight, :price_unit, :profit, :price_2, :price_3, :price_4, :price_5, :brand, :sku, :created_at, :updated_at
json.url product_url(product, format: :json)
