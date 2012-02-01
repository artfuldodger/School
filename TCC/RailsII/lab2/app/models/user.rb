class User < ActiveRecord::Base
  has_secure_password
  
  validates_presence_of :password, on: :create
  validates :email, :name, presence: true
  validates_uniqueness_of :email

  attr_accessible :email, :name, :password, :password_confirmation, :role_id

  belongs_to :role
  has_many :link_votes

  def is_admin?
    role.name == 'admin'
  end

  def is_moderator?
    role.name == 'moderator'
  end

  def is_at_least_a_moderator?
    is_moderator? || is_admin?
  end

end
