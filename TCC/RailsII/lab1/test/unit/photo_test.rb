require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "it requires a title" do
    photo = Photo.new(:album => albums(:one), :image => 'asdf')
    assert !photo.save, "Saved the photo without a title"
  end

  test "it requires an album" do
    photo = Photo.new(:title => "My Photo", :image => 'asdf')
    assert !photo.save, "Saved the photo without an album"
  end

  test "it requires image binary data" do
    photo = Photo.new(:title => "My Photo", :album => albums(:one))
    assert !photo.save, "Saved the photo without any binary data"
  end
end
