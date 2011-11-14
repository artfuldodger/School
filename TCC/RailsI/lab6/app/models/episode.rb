class Episode < ActiveRecord::Base
  validates :title, :episode_number, :presence => true
  validates_numericality_of :episode_number, :only_integer => true
  belongs_to :series
end
