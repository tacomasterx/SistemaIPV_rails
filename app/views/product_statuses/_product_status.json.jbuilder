json.extract! product_status, :id, :name, :managable, :created_at, :updated_at
json.url product_status_url(product_status, format: :json)
