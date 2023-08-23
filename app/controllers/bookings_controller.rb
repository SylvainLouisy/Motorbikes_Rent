class BookingsController < ApplicationController
  # booking est rattaché à un motorbike
  # booking est rattaché à un user

  # booking a une date de début
  # booking a une date de fin
  # booking a un user_id
  # reviews est rattaché à un motorbike
  # si on supprime un motorbike, on supprime les reviews associées
  # on va faire un formulaire flatpickr.js pour faire un calendrier qui sera disponible sue la show de motorbike
  before_action :set_booking, only: %i[destroy]
  before_action :set_motorbike, only: %i[create]
  before_action :set_user

  def create
    @booking = Booking.new(booking_params)
    @booking.motorbike = @motorbike
    @booking.user = @user
    start_date_string, end_date_string = params[:booking][:date_range].split(" to ")

    if start_date_string && end_date_string != ''
      @booking.start_date = Date.parse(start_date_string)
      @booking.end_date = Date.parse(end_date_string)
    end
    if @booking.save
      redirect_to motorbike_path(@motorbike)
    else
      render "motorbikes/show", status: :unprocessable_entity
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

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
