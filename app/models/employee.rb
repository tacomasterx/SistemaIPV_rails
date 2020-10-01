class Employee < ApplicationRecord
  has_many :users
  belongs_to :shop
  has_many :inventory_items
  has_many :sales
  has_many :sale_sessions
end
