class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = current_user.articles.build
    @categories = Category.order(priority: :desc)
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong"
      render 'new'
    end
  end  

  def index
    @articles = Article.includes(:author).all
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_list)
  end
end
