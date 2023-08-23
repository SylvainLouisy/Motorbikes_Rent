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

    regex = /(\d{4}-\d{2}-\d{2})\s+to\s+(\d{4}-\d{2}-\d{2})/
    match = @booking.start_date.match(regex)

    if match
      start_date = match[1]
      end_date = match[2]
      @Booking.start_date = start_date.to_date
      @booking.end_date = end_date.to_date
    end
    # split la donnée start_date en deux via le to
    #prendre le premier élément de l'array, le transformer en date et l'assigner a @Booking.start_date
    #même chose pour le deuxième pour end_date
    if @booking.save
      redirect_to motorbike_path(@motorbike)
      render :show, notice: 'Booking was successfully created.'
    else
      @review = Review.new
      render :new, notice: 'Booking was not created.'
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
