class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.integer :episode_number

      t.timestamps
    end
  end
end
