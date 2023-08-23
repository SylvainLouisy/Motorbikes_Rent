class BookingsController < ApplicationController
    # booking est rattaché à un motorbike
# booking est rattaché à un user

# booking a une date de début
# booking a une date de fin
# booking a un user_id
# reviews est rattaché à un motorbike
# si on supprime un motorbike, on supprime les reviews associées
# on va faire un formulaire flatpickr.js pour faire un calendrier qui sera disponible sue la show de motorbike
before_action :set_booking, only: [:show, :destroy]
before_action :set_motorbike, only: [:new, :create]


  def new
    @booking = Booking.new
    # @review = Review.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.motorbike = @motorbike
    @booking.user = current_user
    if @booking.save
      redirect_to motorbike_path(@motorbike)
      render :show, notice: 'Booking was successfully created.'
    else
      redirect_to motorbike_path(@motorbike)
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path(@booking.motorbike), status: :see_other, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
