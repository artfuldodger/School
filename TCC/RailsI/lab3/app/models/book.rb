class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :category
  has_and_belongs_to_many :authors

  validates :title, :isbn, :presence => true

  scope :uncategorized, lambda { where("category_id is null") }
end
