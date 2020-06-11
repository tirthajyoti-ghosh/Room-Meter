module ArticlesHelper
  def category_articles
    html = ''
    (0...@category.articles.length).each do |i|
      html += "<div class='article-row'>" if i.even?
      html += <<~MLS
        <div class="article">
          <img alt="#{@category.articles[i].title}" class="image" src="#{@category.articles[i].image}" width="200" height="150">
          <article class="article-body">
            <h2>#{@category.name}</h2>
            <h3>#{@category.articles[i].title}</h3>
            <p class="author">by &nbsp;<span class="name">#{@category.articles[i].author.name}</span></p>
            <p class="text">#{@category.articles[i].text}</p>
            #{display_vote_for(@category.articles[i], current_user.id)}
          </article>
        </div>
      MLS

      html += '</div>' if i.odd? || @category.articles.length == 1
    end

    html.html_safe
  end
end
