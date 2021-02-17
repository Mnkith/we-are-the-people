class ChangePasswordToPasswordDigestInAdvocates < ActiveRecord::Migration[5.2]
  def change 
    rename_column :advocates, :password, :password_digest
  end
end