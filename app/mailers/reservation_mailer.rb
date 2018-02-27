class ReservationMailer < ApplicationMailer
  default from: "okokokok28282828@gmail.com"

  def booking_email(customer, host, listing_id, reservation_id)

    @customer = customer
    @host = host
    @reservation_id = reservation_id
    @listing_id = listing_id

    @url = listing_reservation_url(@listing_id, @reservation_id)
    

    mail(to: @host.email, subject: "Your Property Reservation Is Confirmed ")
  end

end
