class Payment < ApplicationRecord
  belong_to :user
  has_one :cart
end
