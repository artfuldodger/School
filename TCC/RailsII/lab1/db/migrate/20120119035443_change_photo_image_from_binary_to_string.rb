class ChangePhotoImageFromBinaryToString < ActiveRecord::Migration
  def up
    change_column :photos, :image, :string
  end

  def down
    change_column :photos, :image, :binary
  end
end
