class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :store
      t.string :name
      t.integer :quantity
      t.boolean :weekly

      t.timestamps
    end
    add_index :items, :store_id
  end
end
