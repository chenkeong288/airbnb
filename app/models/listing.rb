class Listing < ApplicationRecord

  belongs_to :user					#to declare that the listing belong to current user and one user has many listings

  has_many :reservations, dependent: :destroy

  paginates_per 6          # to set number of listing per page

  mount_uploaders :images, AvatarUploader
	
  scope :title, -> (input_title) { where("title like?", "#{input_title}%") }
  scope :location, -> (input_location) { where("location like?", "#{input_location}")}
  scope :description, -> (input_description) { where("description ILIKE ?", "%#{input_description}%") }

end
