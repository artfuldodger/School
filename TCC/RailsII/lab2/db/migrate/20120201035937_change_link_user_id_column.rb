class ChangeLinkUserIdColumn < ActiveRecord::Migration
  def change
    rename_column :links, :user_id_id, :user_id
  end
end
