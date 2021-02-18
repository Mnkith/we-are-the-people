class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :advocate_name
      t.string :cause_name
      t.timestamps null: false
    end
  end
end
