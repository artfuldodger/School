require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    test_image = fixture_path + "gangster.jpg"
    @file = Rack::Test::UploadedFile.new(test_image, "image/jpeg")
  end

  teardown do
    file_path = "#{Rails.root}/public/gangster.jpg"
    File.delete(file_path) if File.exists?(file_path)
    Photo.delete_all
  end

  test "it requires a title" do
    photo = Photo.new(:album => albums(:one), :image => @file)
    assert !photo.save, "Saved the photo without a title"
  end

  test "it requires an album" do
    photo = Photo.new(:title => "My Photo", :image => @file)
    assert !photo.save, "Saved the photo without an album"
  end

  test "it requires an image" do
    photo = Photo.new(:title => "My Photo", :album => albums(:two))
    assert !photo.save, "Saved the photo without any binary data"
  end

  test "it saves the upload image's original filename with the current timestamp as the image attribute" do
    photo = Photo.new(:title => 'A picture', :album => albums(:one), :image => @file, :album => albums(:two))
    assert photo.image == @file.original_filename, "Photo image attribute not file's original attribute"
  end

  test "it won't save two images with the same original file name" do
    photo = Photo.new(:title => 'First picture', :album => albums(:one), :image => @file, :album => albums(:two))
    photo2 = Photo.new(:title => 'Second picture', :album => albums(:one), :image => @file, :album => albums(:two))
    assert photo.save
    assert !photo2.save, "Saved file with same image as prexisting photo"
  end

  test "it knows when it is the first in the album" do
    photo = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert photo.first_in_album?, "First photo didn't think it was first."
  end

  test "it knows when it is the last in the album" do
    photo = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert photo2.last_in_album?, "Photos: #{photo2.album.photos.all.map{ |x| "#{x.id} : #{x.title}" }.inspect}"#Last photo didn't think it was last."
  end

  test "it knows when it is not the first in the album" do
    photo = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert !photo2.first_in_album?, "Second photo thought it was first."
  end

  test "it knows when it is not the last in the album" do
    photo = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert !photo.last_in_album?, "First photo throught it was first."
  end

  test "it knows how to find the next photo in the album" do
    photo1 = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert photo1.next == photo2
  end

  test "it knows how to find the previous photo in the album" do
    photo1 = photos(:photo_album_one_id_1)
    photo2 = photos(:photo_album_one_id_2)
    assert photo2.previous == photo1
  end

end
