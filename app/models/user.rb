class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews
  has_many :users_products, class_name: Product
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
end
