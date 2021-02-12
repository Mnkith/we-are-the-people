class AddMetColumnToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :met, :boolean, default: false
  end
end
