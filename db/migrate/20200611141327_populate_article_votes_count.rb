class PopulateArticleVotesCount < ActiveRecord::Migration[6.0]
  def up
    Article.find_each do |article|
      Article.reset_counters(article.id, :votes)
    end
  end
end
