class AddPsdigest < ActiveRecord::Migration[6.0]
  def change
    add_column :users,  :password_digest, :string
    remove_column :users, :ps
  end
end
