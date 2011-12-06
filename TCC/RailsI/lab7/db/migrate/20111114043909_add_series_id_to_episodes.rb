class AddSeriesIdToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :series_id, :integer
  end
end
