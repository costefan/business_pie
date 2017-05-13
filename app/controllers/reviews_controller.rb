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
    @reviews = Review.all
  end

  def feed
    @all_reviews = Review.all

    respond_to do |format|
      format.rss { render :layout => false }
    end
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
