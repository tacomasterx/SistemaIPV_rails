class ProductType < ApplicationRecord
  has_many :products
  has_many :product_subtypes
end
