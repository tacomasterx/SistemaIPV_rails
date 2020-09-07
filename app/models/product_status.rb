class ProductStatus < ApplicationRecord
  has_many :inventory_items
end
