module ApplicationHelper
  def display_vote_for(article, user_id)
    vote_status = Article.already_voted?(article, user_id)

    vote_count = if article.votes_count.nil?
                   0
                 else
                   article.votes_count
                 end

    if vote_status
      content_tag(:p, class: 'voted') do
        "<i class='fas fa-heart'></i> #{vote_count}".html_safe
      end
    else
      link_to(article_votes_path(article), method: :post, class: 'vote') do
        "<i class='far fa-heart'></i> #{vote_count}".html_safe
      end
    end
  end
end
