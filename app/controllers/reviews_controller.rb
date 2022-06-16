class ReviewsController < ApplicationController
  def create
    @cooker = User.find(params[:cooker_id])
    @review = Review.new(review_params)
    @review.cooker_id = @cooker
    if @review.save
      redirect_to cooker_path(@cooker)
    else
      render 'cookers/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
