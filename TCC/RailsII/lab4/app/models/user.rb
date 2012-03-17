class User < ActiveRecord::Base
  has_secure_password
  
  validates_presence_of :password, on: :create
  validates :username, presence: true, uniqueness: true

  attr_accessible :username, :password, :password_confirmation

  has_many :stores
  has_many :items, through: :store
end
