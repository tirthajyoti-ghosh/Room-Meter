module ApplicationHelper
  def display_vote_for(article, user_id)
    vote_count = Article.vote_count_of(article)
    vote_status = Article.already_voted?(article, user_id)

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
