class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :title, null: false
      t.text :description
      t.string :image_link
      t.timestamps null: false
    end
  end
end
