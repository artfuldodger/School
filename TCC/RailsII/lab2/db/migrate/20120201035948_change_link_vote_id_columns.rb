class ChangeLinkVoteIdColumns < ActiveRecord::Migration
  def change
    rename_column :link_votes, :user_id_id, :user_id
    rename_column :link_votes, :link_id_id, :link_id
  end
end
