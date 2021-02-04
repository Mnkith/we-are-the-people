class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :advocate_id
      t.timestamps null: false
    end
  end
end
