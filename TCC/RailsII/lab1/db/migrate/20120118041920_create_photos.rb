class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.references :album
      t.binary :image

      t.timestamps
    end
    add_index :photos, :album_id
  end
end
