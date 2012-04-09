class Widget < ActiveRecord::Base
  validates :name, :description, presence: true
end
