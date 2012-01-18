class Photo < ActiveRecord::Base
  belongs_to :album
  validates :title, :album, :image, :presence => true
end
