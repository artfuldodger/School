class Ebook < Book
  validates :download_size, :presence => true
end