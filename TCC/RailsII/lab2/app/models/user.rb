class User < ActiveRecord::Base
  has_secure_password
  
  validates_presence_of :password, on: :create
  validates :email, :name, presence: true
  validates_uniqueness_of :email

  attr_accessible :email, :name, :password, :password_confirmation, :role_id

  belongs_to :role

  def is_admin?
    role.name == 'admin'
  end

  def is_moderator?
    role.name == 'moderator'
  end

end
