class LinkComment < ActiveRecord::Base
  belongs_to :link_id
  belongs_to :user_id
end
