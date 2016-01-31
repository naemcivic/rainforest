class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
end
