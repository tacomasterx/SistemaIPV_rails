class ProductStatus < ApplicationRecord
  has_many :inventory_items
  scope :as_option, ->{ where("id < 3") }#where({ product_status_id: [1, 2]})
  scope :managable_statuses, ->{ where(managable: 1) }
  scope :unmanagable_statuses, ->{ where(managable: 0) }
end
