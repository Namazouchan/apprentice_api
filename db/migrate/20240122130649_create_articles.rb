class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :body
      t.string :slug
      t.text :tagList

      t.timestamps
    end
  end
end
