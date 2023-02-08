class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :a_auth
      t.date  :a_date
      t.text :a_content
      t.string :a_cat
      
      t.timestamps
    end
  end
  
end
