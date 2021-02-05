class ChangeColumnNameInCauses < ActiveRecord::Migration
  def change
    remove_column :causes, :title
    add_column :causes, :name, :string
  end
end
