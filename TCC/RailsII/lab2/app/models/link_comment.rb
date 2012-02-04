class LinkComment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user

  validates :link_id, :user_id, :comment, presence: true

  default_scope order: 'created_at desc'
end
