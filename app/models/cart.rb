class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  has_one :payment
end
