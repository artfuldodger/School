require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
    @photo = photos(:one)
  end

  test "should get index" do
    get :index, album_id: @album.to_param
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should get new" do
    get :new, album_id: @album.to_param
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, photo: @photo.attributes, album_id: @album.to_param
    end

    assert_redirected_to album_photo_path(@album, assigns(:photo))
  end

  test "should show photo" do
    get :show, id: @photo.to_param, album_id: @album.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo.to_param, album_id: @album.to_param
    assert_response :success
  end

  test "should update photo" do
    put :update, id: @photo.to_param, album_id: @album.to_param, photo: @photo.attributes
    assert_redirected_to album_photo_path(assigns(:photo))
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo.to_param, album_id: @album.to_param
    end

    assert_redirected_to album_photos_path
  end
end
