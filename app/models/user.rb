class User < ActiveRecord::Base
  validates :email, :full_name, :password, presence: true
  validates :email, uniqueness: true
  has_secure_password validations: false

  has_many :carts

  has_many :payments
end
