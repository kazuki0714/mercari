class Item < ApplicationRecord
  has_many :cart
  has_many :cart_items
  accepts_nested_attributes_for :cart
  accepts_nested_attributes_for :cart_items
  belongs_to :user, optional: true  #　optionalでbelongs_toのデフォルトが関連先の値を検査しないようにする
  validates :title, presence: true
  mount_uploader :image, ImageUploader

  def self.search(search)
     return Item.all unless search
     Item.where(['content LIKE ?', "%#{search}%"])
  end
end
