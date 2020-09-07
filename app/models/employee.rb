class Employee < ApplicationRecord
  has_many :users
  belongs_to :shop
  has_many :inventory_items
end
