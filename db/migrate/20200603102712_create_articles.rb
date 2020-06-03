class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :author_id

      t.timestamps
    end

    add_index :articles, :author_id
  end
end
