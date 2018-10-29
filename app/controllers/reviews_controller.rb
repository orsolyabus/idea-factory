class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

  def create
    idea = Idea.find params[:idea_id]
    review = Review.new review_params
    review.user = current_user
    review.idea = idea
    review.save
    redirect_to idea_path(idea)
  end

  def destroy
    review = Review.find params[:id]
    if can? :delete, review
      review.destroy
      redirect_to idea_path(review.idea)
    else
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
