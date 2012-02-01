class CreateLinkVotes < ActiveRecord::Migration
  def change
    create_table :link_votes do |t|
      t.references :user_id
      t.references :link_id

      t.timestamps
    end
    add_index :link_votes, :user_id_id
    add_index :link_votes, :link_id_id
  end
end
