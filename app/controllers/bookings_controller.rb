class BookingsController < ApplicationController
  # booking est rattaché à un motorbike
# booking est rattaché à un user

# booking a une date de début
# booking a une date de fin
# booking a un user_id
# reviews est rattaché à un motorbike
# si on supprime un motorbike, on supprime les reviews associées
# on va faire un formulaire flatpickr.js pour faire un calendrier qui sera disponible sue la show de motorbike

# def index
#   @bookings = Booking.all
# end

# def new
#   @booking = Booking.new
# end

# def edit
#   @booking = Booking.find(params[:id])
# end

# def create
#   @booking = Booking.new(booking_params)
#   @booking.user = current_user
#   @booking.motorbike = Motorbike.find(params[:motorbike_id])
#   if @booking.save
#     redirect_to bookings_path
#   else
#     render :new
#   end
# end



# def show
#   @booking = Booking.find(params[:id])
# end

# def update
#   @booking = Booking.find(params[:id])
#   @booking.update(booking_params)
#   redirect_to bookings_path
# end

# def destroy
#   if current_user == @booking.user
#     @booking = Booking.find(params[:id])
#     @booking.destroy
#     redirect_to bookings_path
#   else
#     redirect_to bookings_path
#   end
# end

# private

# def booking_params
#   params.require(:booking).permit(:start_date, :end_date, :user_id, :motorbike_id)
# end

# def set_booking
#   @booking = Booking.find(params[:id])
# end
