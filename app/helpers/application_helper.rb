module ApplicationHelper
  def vote_count(article_id)
    Vote.where(article_id: article_id).count
  end

  def max_voted_article
    if Vote.any?
      max_vote_article_id = Vote.group(:article_id).count.max[0]
      Article.find(max_vote_article_id)
    end
  end

  def display_vote_for(article)
    unless already_voted?(article)
      link_to("Vote", article_votes_path(article), method: :post)
    end
  end

  def already_voted?(article)
    Vote.exists?(user_id: current_user.id, article_id: article.id)
  end
end
