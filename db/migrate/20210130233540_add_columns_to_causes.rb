class AddColumnsToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :goal, :integer, default: 500
    add_column :causes, :current, :integer, default: 0
  end
end
