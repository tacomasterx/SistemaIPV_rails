class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_subtype
  has_many :inventory_items
end
