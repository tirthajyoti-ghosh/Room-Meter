class ChangeColumnDefaultInCategories < ActiveRecord::Migration[6.0]
  def change
    change_column_default :categories, :priority, 1
  end
end
