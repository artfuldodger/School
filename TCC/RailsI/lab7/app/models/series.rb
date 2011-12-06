class Series < ActiveRecord::Base
  validates :title, :start_date, :end_date, :presence => true
  
  has_many :episodes
end