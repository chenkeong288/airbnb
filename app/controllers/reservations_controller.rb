class ReservationsController < ApplicationController


  def user_reservations
    @user_reservations = current_user.reservations
    # @user_listings = current_user.listings
  end


  def new
    @listing = Listing.all.find(params[:listing_id])
    @reservation = Reservation.new  
    # render template: "reservations/new"
  end


  def create
    @listing = Listing.all.find(params[:listing_id])

    @reservation = current_user.reservations.new(reservation_params)  
    @reservation.number_of_days = ( (reservation_params[:end_date].to_i - reservation_params[:start_date].to_i) + 1 )      # to fill in total reservation days into number_of_days column
    @reservation.listing_id = params[:listing_id]                                                                          # to fill in listing's id into listing_id column  (Note: For association purpose, we have to explicitly fill in the listing_id column unlike user_id, because for user id, rails know how to fill in the user_id column based on the id of currently logged-in user)
      # @reservation.listing_id = @listing.id                                                              # alternative way to store listing id into listing_id column    
    @reservation.price = @reservation.number_of_days * @listing.price


    if @reservation.save
      
      host = User.find(@listing.user_id)

      ReservationMailer.booking_email(current_user, host, @listing.id, @reservation.id).deliver_later      # Code to call booking_email method under the ReservationMailer class

      redirect_to [@reservation.listing, @reservation]                                                     # show (rails know @reservation.listing refers to listing id and @reservation refers to reservation id)
      # redirect_to listing_reservation_path(@reservation.listing.id, @reservation.id)                     # alternative way to show
    else 
      redirect_to new_listing_reservation_path(@listing)
    end  

  end


  def show
    @reservation = Reservation.all.find(params[:id])
  end



  private


  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests)
  end

end











