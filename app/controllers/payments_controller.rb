class PaymentsController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
  end


  def checkout

    #Total price
    @reservation = Reservation.find_by(id: params[:id])

    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => @reservation.total_price, 
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )


    if result.success?

      @reservation.payment_status = "Yes"                     # Make payment_status of the reservation in the Reservation listing "yes"
      @reservation.save                                       # Save it

      redirect_to listings_path, :flash => { :success => "Transaction successful!" }
    else
      redirect_to listings_path, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
