class InventoryItem < ApplicationRecord
  belongs_to :shop
  belongs_to :product
  belongs_to :product_status
  belongs_to :employee
end
