class SaleSession < ApplicationRecord
  belongs_to :employee
  belongs_to :sale
end
