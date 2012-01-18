class Album < ActiveRecord::Base
  validates :title, :presence => true
end
