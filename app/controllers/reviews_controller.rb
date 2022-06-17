class ReviewsController < ApplicationController
  def create
    @cooker = User.find(params[:cooker_id])
    @review = Review.new(review_params)
    @review.cooker = @cooker

    respond_to do |format|
    if @review.save
      format.html { redirect_to cooker_path(@cooker, anchor: "review-#{@review.id}") }
      format.json # Follow the classic Rails flow and look for a create.json view
    else
      format.html { render 'cookers/show' }
      format.json
    end
  end
end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
