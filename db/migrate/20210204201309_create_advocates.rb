class CreateAdvocates < ActiveRecord::Migration[5.2]
  def change
    create_table :advocates do |t|
      t.string :name
      t.string :email
      t.string :passowrd
      t.timestamps null: false
    end
  end
end
