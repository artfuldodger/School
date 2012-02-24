class User < ActiveRecord::Base
  has_secure_password
  
  validates_presence_of :password, on: :create
  validates :email, :name, presence: true
  validates_uniqueness_of :email

  attr_accessible :email, :name, :password, :password_confirmation, :is_admin

  has_many :questions
  has_many :answers

  def questions_answered
    self.answers.map(&:question).reject(&:nil?).uniq
  end
end
