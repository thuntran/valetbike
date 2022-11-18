class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:email] #gives reg error when email not present
  validates :email, uniqueness: true

  has_many :rides, class_name: :Ride, foreign_key: :bike_id
  
end
