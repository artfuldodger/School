class Photo < ActiveRecord::Base
  belongs_to :album
  validates :title, :album, :image, presence: true
  validates :image, uniqueness: true

  def image=(image)
    path = File.join('public/images', image.original_filename)
    File.open(path, "wb") { |f| f.write(image.read) }
    write_attribute(:image, image.original_filename)
  end

  def first_in_album?
    !self.album.photos.where('id < ?', self.id).any?
  end

  def last_in_album?
    !self.album.photos.where('id > ?', self.id).any?
  end

  def previous
    self.album.photos.where('id < ?', self.id).order('id desc').first
  end

  def next
    self.album.photos.where('id > ?', self.id).order('id asc').first
  end

  def destroy
    super
    file_path = File.join(Rails.root, 'public/images', self.image)
    File.delete(file_path) if File.exists?(file_path)
  end
end
