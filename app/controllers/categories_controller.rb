class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = Category.includes(:articles).find(params[:id])
  end
end
