class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true
  has_one :address
  has_one :payment
end
