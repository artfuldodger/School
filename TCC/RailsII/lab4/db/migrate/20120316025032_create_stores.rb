class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :stores, :user_id
  end
end
