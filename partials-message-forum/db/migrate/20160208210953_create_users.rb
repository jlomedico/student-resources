class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :username

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
