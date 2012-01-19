class Album < ActiveRecord::Base
  validates :title, :description, :presence => true
  has_many :photos

  def destroy
    # ensure we physically delete each photo's image
    photos.each do |photo|
      photo.destroy
    end
    super
  end
end
