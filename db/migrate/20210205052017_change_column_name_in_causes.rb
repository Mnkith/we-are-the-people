class ChangeColumnNameInCauses < ActiveRecord::Migration[5.2]
  def change
    remove_column :causes, :title
    add_column :causes, :name, :string
  end
end
