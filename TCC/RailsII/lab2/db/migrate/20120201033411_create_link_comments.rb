class CreateLinkComments < ActiveRecord::Migration
  def change
    create_table :link_comments do |t|
      t.references :link_id
      t.references :user_id
      t.text :comment

      t.timestamps
    end
    add_index :link_comments, :link_id_id
    add_index :link_comments, :user_id_id
  end
end
