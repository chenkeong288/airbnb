class Listing < ApplicationRecord

  belongs_to :user					#to declare that the listing belong to current user and one user has many listings

  has_many :reservations, dependent: :destroy

  paginates_per 8          # to set number of listing per page

  mount_uploaders :images, AvatarUploader
	
  scope :title, -> (input_title) { where("title ILIKE ?", "#{input_title}%") }                           # ILIKE allows search for keyword anywhere,rather than by specific word. And also not case sensitive.
  scope :location, -> (input_location) { where("location ILIKE ?", "%#{input_location}%")}
  scope :description, -> (input_description) { where("description ILIKE ?", "%#{input_description}%") }
          # def self.description(input_description)
          #   where(description: input_description)
          # end 

  include PgSearch
  pg_search_scope :search_all, :against => [:title, :location, :description]

  

  #autocomplete
  def self.search_title(query)
    where("title ILIKE :title", title: "%#{query}%").map do |record|
      record.title 
    end
  end

                          
end


