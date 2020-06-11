module ApplicationHelper
  def max_voted_article
    article = Article.max_voted

    html = <<~MLS
      <article class="article-big" style="background: url('#{article.image}'); background-size: cover;">
        <a href="/" class="gradient"></a>
        <div class="content">
          <h1>#{article.title}</h1>
          <span class="text">#{article.text}</span>
        </div>
      </article>
    MLS

    html.html_safe
  end

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
