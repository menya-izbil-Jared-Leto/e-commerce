class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :purchases
  has_many :purchased_products, through: :purchases, source: :product
  has_many :carts
  has_many :cart_products, through: :carts, source: :product
  
  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable

  validates :first_name, :last_name, 
  presence: true, length: { maximum: 100 }
  
  validates :email, 
  presence: true, length: { maximum: 150 }, 
  format: { with: URI::MailTo::EMAIL_REGEXP }
end
