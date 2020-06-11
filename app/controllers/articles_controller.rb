class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.includes(:author).all
    @categories = Category.includes(%i[articles categorizations]).all
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = 'Article successfully created'
      redirect_to root_path
    else
      flash.now[:notice] = 'Something went wrong. Try again.'
      @categories = Category.all
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_list, :image)
  end
end
