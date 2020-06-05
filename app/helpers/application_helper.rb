module ApplicationHelper
  def vote_count(article_id)
    Vote.where(article_id: article_id).count
  end

  def max_voted_article
    if Vote.any?
      vote_hash = Vote.group(:article_id).count
      max_value = vote_hash.values.max
      max_vote_article_id = vote_hash.key(max_value)
      Article.find(max_vote_article_id)
    end
  end

  def display_vote_for(article)
    vote_count = article.votes.count
    unless already_voted?(article)
      link_to("#{pluralize(vote_count, "vote")}", article_votes_path(article), method: :post)
    else
      content_tag(:p, "#{pluralize(vote_count, "vote")}")
    end
  end

  def already_voted?(article)
    Vote.exists?(user_id: current_user.id, article_id: article.id)
  end
end
