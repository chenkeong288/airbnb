class Listing < ApplicationRecord

  belongs_to :user					#to declare that the listing belong to current user and one user has many listings

  has_many :reservations, dependent: :destroy

  paginates_per 6          # to set number of listing per page

  mount_uploaders :images, AvatarUploader
	
end
