class Shop < ApplicationRecord
  has_many :employees
  has_many :inventory_items
  has_many :sales
end
