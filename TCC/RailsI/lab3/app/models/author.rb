class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :first_name, :last_name, :presence => true
end
