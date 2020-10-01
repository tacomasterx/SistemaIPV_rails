class InventoryItem < ApplicationRecord
  belongs_to :shop
  belongs_to :product
  belongs_to :product_status
  belongs_to :employee
  has_many :transactions
  has_many :sales, through: :transactions
end
