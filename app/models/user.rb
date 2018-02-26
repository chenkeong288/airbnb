class User < ApplicationRecord
  include Clearance::User

  has_many :listings, dependent: :destroy       #1 user has many listings, it gives more methods to users... dependent: :destroy will remove all listings pertaining to particular user if the user is deleted
  has_many :reservations, dependent: :destroy
end
