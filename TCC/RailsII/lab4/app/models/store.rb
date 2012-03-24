class Store < ActiveRecord::Base
  belongs_to :user
  has_many :items

  def keyboard_shortcut
    name[0]
  end
end
