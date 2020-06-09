class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_back fallback_location: root_path, notice: 'You voted for this article'
    else
      redirect_back fallback_location: root_path, notice: 'You already voted for this article'      
    end
  end
end
