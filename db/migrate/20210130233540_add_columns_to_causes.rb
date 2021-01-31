class AddColumnsToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :goal, :integer, default: 0
    add_column :causes, :current, :integer, default: 0
  end
end
