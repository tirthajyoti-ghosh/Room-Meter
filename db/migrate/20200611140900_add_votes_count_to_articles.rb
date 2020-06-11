class AddVotesCountToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :votes_count, :integer
  end
end
