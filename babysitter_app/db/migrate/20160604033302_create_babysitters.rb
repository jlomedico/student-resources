class CreateBabysitters < ActiveRecord::Migration
  def change
    create_table :babysitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :phone_number
      t.integer :rate
      t.integer :sat_score

      t.timestamps null: false
    end
  end
end
