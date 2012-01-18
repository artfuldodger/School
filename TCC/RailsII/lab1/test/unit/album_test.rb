require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "it requires a title" do
    album = Album.new(:description => 'Some pictures')
    assert !album.save, "Saved the album without a title"
  end

  test "it requires a description" do
    album = Album.new(:title => 'Some title')
    assert !album.save, "Saved the album without a description"
  end

  test "it saves when title and description provided" do
    album = Album.new(:title => 'Title', :description => 'Description')
    assert album.save, "Didn't save album when title and description both provided."
  end
end
