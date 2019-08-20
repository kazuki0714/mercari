class Item < ApplicationRecord
  has_many :carts
  belongs_to :user,optional: true #　optionalでbelongs_toのデフォルトが関連先の値を検査しないようにする
end
