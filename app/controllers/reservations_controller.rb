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
    @reservation = current_user.reservations.new(reservation_params)
    
    @reservation.listing_id = params[:listing_id]         # to store listing id into listing_id column
      # @reservation.listing_id = @listing.id             # alternative way to store listing id into listing_id column
    
    if @reservation.save
      redirect_to [@reservation.listing, @reservation]                                    # show (rails know @reservation.listing refers to listing id and @reservation refers to reservation id)
      # redirect_to listing_reservation_path(@reservation.listing.id, @reservation.id)    # alternative way to show
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