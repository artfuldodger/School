class Item < ActiveRecord::Base
  belongs_to :store
  validates :name, presence: true

  def quantity
    read_attribute(:quantity) || 0
  end

  def display_name
    name + (quantity > 1 ? " (#{quantity})" : '')
  end
end
