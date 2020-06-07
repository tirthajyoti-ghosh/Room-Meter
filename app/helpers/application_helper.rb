module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'nav-link active' : 'nav-link'

    link_to link_text, link_path, class: class_name
  end

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
      link_to(article_votes_path(article), method: :post,  class: "vote") do
        "<i class='far fa-heart'></i> #{vote_count}".html_safe
      end
    else
      content_tag(:p, class: "voted") do
        "<i class='fas fa-heart'></i> #{vote_count}".html_safe
      end
    end
  end

  def already_voted?(article)
    Vote.exists?(user_id: current_user.id, article_id: article.id)
  end
end
