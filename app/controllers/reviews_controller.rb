class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def create
    Review.create(content: review_params[:content], rating: review_params[:rating], restaurant: @restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

