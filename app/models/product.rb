class Product < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_many :purchasers, through: :purchases, source: :user
  has_many :carts
  has_many :cart_users, through: :carts, source: :user
end
