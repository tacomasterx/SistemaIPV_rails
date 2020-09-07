json.extract! employee, :id, :name, :last_name_1, :last_name_2, :rfc, :address, :phone_home, :phone_mobile, :charge, :created_at, :updated_at
json.url employee_url(employee, format: :json)
