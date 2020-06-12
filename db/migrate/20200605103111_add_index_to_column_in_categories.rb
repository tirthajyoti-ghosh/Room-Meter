class AddIndexToColumnInCategories < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, :name, unique: true
  end
end
