class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :advocate_id
      t.timestamps null: false
    end
  end
end
