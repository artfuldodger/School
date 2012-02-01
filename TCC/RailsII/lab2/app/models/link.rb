class Link < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :url, presence: true
  has_many :link_votes

  def points
    link_votes.size
  end
end
