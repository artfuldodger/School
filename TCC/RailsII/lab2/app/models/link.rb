class Link < ActiveRecord::Base
  
  validates :user_id, :title, :url, presence: true
  
  has_many :link_votes
  has_many :voted_for_by_users, through: :link_votes, source: :user
  belongs_to :user
  has_many :comments, class_name: 'LinkComment', source: :link_comments

  def points
    link_votes.size
  end
end
