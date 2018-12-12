class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :year
      t.string :thumbnail, default: 'https://www.learnforeignlanguageskills.com/user/categories/thumbnails/irish%20book.jpg'

      t.timestamps
    end
  end
end
