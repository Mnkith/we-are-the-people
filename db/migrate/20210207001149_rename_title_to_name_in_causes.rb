class RenameTitleToNameInCauses < ActiveRecord::Migration[5.2]
  def change 
    rename_column :causes, :title, :name
  end
end
