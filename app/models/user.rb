class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
