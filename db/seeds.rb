# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)









#Seeding: To create dummy data by using the Fakers Gem.

#Seed Users
user = {}
user["password"] = "asdf"
# user["password_confirmation"] = "asdf"

ActiveRecord::Base.transaction do
  20.times do
    user["email"] =  Faker::Internet.email
 
    User.create(user)
  end 
end 


#Seed Listings 
listings = {}
uids =[]
User.all.each do |u|
  uids << u.id
end 


ActiveRecord::Base.transaction do
  40.times do 
    listings["user_id"] = uids[rand(23)]
    listings["title"] = Faker::Name.name + "'s house"
    listings["location"] = Faker::Address.street_name
    listings["description"] = Faker::Name.name + "'s house is beautiful"

    Listing.create(listings)
  end
end