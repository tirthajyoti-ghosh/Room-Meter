class AddColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image, :string
  end
end
