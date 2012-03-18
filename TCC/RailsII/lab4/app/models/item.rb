class Item < ActiveRecord::Base
  belongs_to :store

  def quantity
    read_attribute(:quantity) || 0
  end
end
