class Payment < ApplicationRecord
  belongs_to :user
  has_one :cart
end
