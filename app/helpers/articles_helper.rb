module ArticlesHelper
  def article_row_decider(position, index, length)
    html = ''

    case position
    when 'top'
      html = "<div class='article-row'>" if index.even?
    when 'bottom'
      html = '</div>' if index.odd? || length == 1
    end

    html.html_safe
  end
end
