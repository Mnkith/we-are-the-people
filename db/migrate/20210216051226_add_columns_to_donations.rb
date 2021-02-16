class AddColumnsToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :advocate_name, :string
    add_column :donations, :cause_name, :string

  end
end
