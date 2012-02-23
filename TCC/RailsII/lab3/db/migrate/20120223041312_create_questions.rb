class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.references :category
      t.string :title
      t.text :detail

      t.timestamps
    end
    add_index :questions, :user_id
    add_index :questions, :category_id
  end
end
