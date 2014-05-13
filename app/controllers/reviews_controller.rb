class ReviewsController < ApplicationController

  def show
    render json: Review.all, each_serializer: ReviewSerializer
  end

  def create
    review = Review.new review_params

    if review.save
      render json: review, status: 201
    else
      render json: {errors: review.errors.messages}, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :reviewer_id, :content, :file)
  end

end
