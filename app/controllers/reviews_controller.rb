class ReviewsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat = @flat
    @review.save

    redirect_to flat_path(@flat.id)
  end

  def destroy
    @flat = Flat.find(params[:flat_id])
    @review = Review.find(params[:id])
    @review.delete

    redirect_to flat_path(@flat.id)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
§
