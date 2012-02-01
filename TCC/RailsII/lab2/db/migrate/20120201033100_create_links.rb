class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.references :user_id

      t.timestamps
    end
    add_index :links, :user_id_id
  end
end