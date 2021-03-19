class ProductStatus < ApplicationRecord
  has_many :inventory_items
  scope :as_option, ->{ where("id < 3") }#where({ product_status_id: [1, 2]})
end
