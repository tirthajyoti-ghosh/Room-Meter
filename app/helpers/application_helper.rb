module ApplicationHelper
  def vote_count(article_id)
    Vote.where(article_id: article_id).count
  end

  def max_voted_article
    return unless Vote.any?

    vote_hash = Vote.group(:article_id).count
    max_value = vote_hash.values.max
    max_vote_article_id = vote_hash.key(max_value)

    Article.find(max_vote_article_id)
  end

  def display_vote_for(article, user_id)
    vote_count = article.votes.count
    if already_voted?(article, user_id)
      content_tag(:p, class: 'voted') do
        "<i class='fas fa-heart'></i> #{vote_count}".html_safe
      end
    else
      link_to(article_votes_path(article), method: :post, class: 'vote') do
        "<i class='far fa-heart'></i> #{vote_count}".html_safe
      end
    end
  end

  def already_voted?(article, user_id)
    Vote.exists?(user_id: user_id, article_id: article.id)
  end
end
