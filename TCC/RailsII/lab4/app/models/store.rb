class Store < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :name, presence: true

  def keyboard_shortcut
    name[0]
  end
end
