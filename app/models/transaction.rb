class Transaction < ApplicationRecord
  belongs_to :sale
  belongs_to :inventory_item
end
