class ReviewsController < ApplicationController

  def index
    render json: Review.all, each_serializer: ReviewSerializer
  end

  def show
    render json: Review.find(params[:id]), each_serializer: ReviewSerializer
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render({json: @review, status: 201, serializer:ReviewSerializer})
    else
      render json: {errors: @review.errors.messages}, status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :reviewer_id, :document_id, :content, :file)
  end

end
