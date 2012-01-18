require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "it requires a title" do
    album = Album.new
    assert !album.save, "Saved the album without a title"
  end
end
