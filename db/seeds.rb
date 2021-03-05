# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "cleaning database"
Room.destroy_all
BandMember.destroy_all
Band.destroy_all
User.destroy_all



5.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    stage_name: Faker::Music::RockBand.name,
    user_type: 'band',
    password: '123123')
    user.save
end


5.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    stage_name: Faker::Music::RockBand.name,
    user_type: 'host',
    password: '123123')
    user.save
end


5.times do
  band = Band.new(
    name: Faker::Music::RockBand.name,
    location: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    number_of_members: 4)
    band.save
end

20.times do
  band_member = BandMember.new(
    user_id: User.where(user_type:"band").pluck(:id).sample,
    band_id: Band.pluck(:id).sample)
    band_member.save
end


addresses = [
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW13 8HL'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW2 4DB'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW17 9HD'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW9 0PZ'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW18 1LP'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW4 6ED'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW19 6PX'
  },
  {
    city: "London",
    country: "United Kingdom",
    postcode: 'SW13 0BY'
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M5 4HY"
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M23 9BJ"
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M28 7JF"
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M27 8AR"
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M33 4WFF"
  },
  {
    city: "Manchester",
    country: "United Kingdom",
    postcode: "M14 6JX"
  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "0713
"  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "10823"
  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "13349"
  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "12277"
  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "13437"
  },
 {
    city: "Berlin",
    country: "Germany",
    postcode: "13353"
  },
  {
    city: "Berlin",
    country: "Germany",
    postcode: "12526"
  },
 {
    city: "Berlin",
    country: "Germany",
    postcode: "13599"
  },
   {
    city: "Barcelona",
    country: "Spain",
    postcode: "08001"
  },
  {
    city: "Barcelona",
    country: "Spain",
    postcode: "08002"
  },
  {
    city: "Barcelona",
    country: "Spain",
    postcode: "08003"
  },
   {
    city: "Barcelona",
    country: "Spain",
    postcode: "08007"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75000"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75003"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75006"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75004"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75011"
  },
   {
    city: "Paris",
    country: "France",
    postcode: "75012"
  },
 {
    city: "Madrid",
    country: "Spain",
    postcode: "28052"
  },
  {
    city: "Madrid",
    country: "Spain",
    postcode: "28041"
  },
  {
    city: "Madrid",
    country: "Spain",
    postcode: "28100"
  },
  {
    city: "Prague",
    country: "Czech Republic",
    postcode: "109 99"
  },
  {
    city: "Prague",
    country: "Czech Republic",
    postcode: "251 99"
  },
  {
    city: "Prague",
    country: "Czech Republic",
    postcode: "119 99"
  },
  {
    city: "Brussels",
    country: "Belgium",
    postcode: "1006"
  },
  {
    city: "Brussels",
    country: "Belgium",
    postcode: "1044"
  },
  {
    city: "Brussels",
    country: "Belgium",
    postcode: "1150"
  },
  {
    city: "Brussels",
    country: "Belgium",
    postcode: "1210"
  },
  {
    city: "Brussels",
    country: "Belgium",
    postcode: "1033"
  }
]


addresses.each do |address|
  room = Room.new(
    name: Faker::Music.album,
    description: Faker::Lorem.paragraph,
    capacity: 3,
    parking: ["street parking", "private parking", "car park", "unavailable"].sample,
    bio: Faker::Lorem.paragraph,
    postcode: address[:postcode],
    city: address[:city],
    country: address[:country],
    user_id: User.where(user_type:"host").pluck(:id).sample)
  room.save
end

