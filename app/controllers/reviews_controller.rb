class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @motorbike = Motorbike.find(params[:motorbike_id])
    @review.motorbike = @motorbike
    if @review.save
      redirect_to motorbike_path(@motorbike)
    else
      render "motorbikes/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to motorbike_path(@review.motorbike)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
