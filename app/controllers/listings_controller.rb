class ListingsController < ApplicationController


	def index
		@listing = Listing.order(created_at: :asc).page params[:page]

	end


	def new
		if signed_in? 																							# current_user represent currently logged-in user
			@listing = Listing.new
		else
			redirect_to listings_path
		end
	end


	def create																										# to save user posted input into the database
		@listing = current_user.listings.new(listing_params)				# listings refers to all listings which belong to current user because 1 user has many listings (association)
		if @listing.save #true 																			# means if the user posting is saved
			redirect_to @listing #show 																# redirect to show this particular post by the user only
		else
			redirect_to new_listing_path															# new_listing is a prefix from route
		end 
	end


	def show
		@listing = Listing.all.find(params[:id])					
	end


	def destroy
		current_user.listings.delete(params[:id])
		redirect_to listings_path
	end


	def edit
		@post_to_edit = current_user.listings.find(params[:id])
	end


	def update
		listing = current_user.listings.find(params[:id])

		listing.update_attributes(listing_params)

		redirect_to listings_path
	end




	private
  #strong parameter
	def listing_params																						#to accept user posted input confidentially
    params.require(:listing).permit(:title, :description, :location, {images: []})
  end


end
