class ReviewsController < ApplicationController
  skip_before_action :check_user, only: :latest

  def create
    @review = current_user.reviews.create(review_params)
    respond_to do |format|
      format.html {redirect_to reviews_url}
      format.js
    end
  end

  def index
    @reviews = current_user.reviews.paginate(page: params[:page],per_page: 2)
  end

  def destroy
    current_user.reviews.destroy(params[:id])
    redirect_to reviews_url
  end

  def latest
    @reviews = Review.last(5)
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end
end
