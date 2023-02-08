class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :ps
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
