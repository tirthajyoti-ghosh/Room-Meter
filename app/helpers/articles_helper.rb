module ArticlesHelper
  def article_row_decider(position, i, length)
    html = ""

    case position
    when "top"
      html = "<div class='article-row'>" if i.even?
    when "bottom"
      html = '</div>' if i.odd? || length == 1      
    end

    html.html_safe
  end
end
