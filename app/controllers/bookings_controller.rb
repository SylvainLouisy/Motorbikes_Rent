class BookingsController < ApplicationController
    # booking est rattaché à un motorbike
# booking est rattaché à un user

# booking a une date de début
# booking a une date de fin
# booking a un user_id
# reviews est rattaché à un motorbike
# si on supprime un motorbike, on supprime les reviews associées
# on va faire un formulaire flatpickr.js pour faire un calendrier qui sera disponible sue la show de motorbike

  def index
    @bookings = Booking.all
  end

  def

end
