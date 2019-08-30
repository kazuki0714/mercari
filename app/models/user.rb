class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :carts
  has_many :addresses
  has_many :payments
  has_many :histories

  validates :name, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 20 }
  validates :zipcode, presence: true, length: { maximum: 20 }
  validates :apartment, presence: true, length: { maximum: 20 }

end
