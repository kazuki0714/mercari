class Item < ApplicationRecord
  has_many :carts
  accepts_nested_attributes_for :carts
  belongs_to :user, optional: true  #　optionalでbelongs_toのデフォルトが関連先の値を検査しないようにする
  validates :title, presence: true
  mount_uploader :image, ImageUploader

end
