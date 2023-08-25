class ReviewsController < ApplicationController
  before_action :set_motorbike, only: [:create, :new]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @motorbike = Motorbike.find(params[:motorbike_id])
    @review.motorbike = @motorbike
    @booking = Booking.new

    if @review.save
      redirect_to motorbike_path(@motorbike), notice: 'La review a été créée avec succès.'
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

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end
end
