class ChangeLinkCommentIdColumns < ActiveRecord::Migration
  def change
    rename_column :link_comments, :link_id_id, :link_id
    rename_column :link_comments, :user_id_id, :user_id
  end
end
