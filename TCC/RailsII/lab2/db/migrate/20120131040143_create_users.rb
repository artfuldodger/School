class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :role_id
      t.string :password_digest

      t.timestamps
    end
  end
end
