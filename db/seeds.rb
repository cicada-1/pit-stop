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

avatars = ["avatar1.png", "avatar2.png", "avatar3.png", "avatar4.png", "avatar5.png", "avatar6.png", "avatar7.png", "avatar8.png", "avatar9.png", "avatar10.png", "avatar11.png", "avatar12.png"]
avatars_to_attach = []

avatars.each do |avatar|
  uploaded_file = Cloudinary::Uploader.upload(File.join("app/assets/images/room-images-pitstop", avatar))
  avatars_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/png' }
  p "avatar uploded"
end

stagenames = ['HaumerTime', 'RockEd', 'Roel', 'CovidCraig', 'Banana', 'FernandoBailando', 'JapanFan', 'BluesPrincess', 'JohnnySavage', 'Bootsrap', 'Rubocop-Auto', 'PythonDude' ]

12.times do |i|
  p "Start Creating User"
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    stage_name: stagenames[i],
    password: '123123',
    photo: avatars_to_attach[i]
  )
  p "user created"
end


bands = ['Le Band Wagon', 'MF Zoom', 'LGTM', 'Code, Wind & Fire', 'Fleetwood Float', 'The JavaScript', 'Buffalo Stringfield', 'The Rolling Rubys', 'CRUD', 'CSS', 'Red Hot Ruby Peppers', 'The Syntax Errors' ]

 12.times do |i|
   band = Band.new(
     name: bands[i],
     location: Faker::Address.full_address,
     description: Faker::Lorem.paragraph,
     number_of_members: 4
    )
    band.save
 end

 24.times do
   band_member = BandMember.new(
     user_id: User.all.sample.id,
     band_id: Band.pluck(:id).sample
    )
    band_member.save
 end

room_details =

[
  {
    name: "Chill groundfloor room",
    photo: ["lon1-room1.jpg", "lon1-room2.jpg", "lon1-room3.jpg", "lon1-room4.jpg"],
    description: "Sleeps 4, wifi access, basement has own bathroom and shower ",
    bio: "Yo! I'm Vince, 32 years of age. I've hosted a few times through Pitstop and really enjoy meeting new people and learning about their music. Everyone welcome, syked to meet you!",
    capacity: 4,
    city: "London",
    country: "United Kingdom",
    postcode: 'SW17 9HD'
  },
  {
    name: "Compact apare room",
    photo: ["lon2-room1.jpg", "lon2-room2.jpg", "lon2-room3.jpg", "lon2-room4.jpg"],
    description: "Sleeps 2 or 3, access to shared bathroom. Wifi is included.",
    bio: "Hi everyone! I'm Paul, I work in music production and really enjoy meeting artists from all over the world. Hosting has been a really rewarding experience for me and my flatmate, and I welcome all kinds of artists with open arms!",
    capacity: 3,
    city: "London",
    country: "United Kingdom",
    postcode: 'SW13 0BY'
  },
  {
    name: "Relaxed basement space",
    photo: ["lon3-room1.jpg", "lon3-room2.jpg","lon3-room3.jpg", "lon3-room4.jpg"],
    description: "Sleeps max 6 people, the basement is stocked with a huge pull-out sofa (+ theres some extra room for mattresses if you need), some jamming gear, wifi and a bathroom. Shower is upstairs.",
    bio: "Hi, I'm Anna and I live with two mates. I work in marketing, but play the drums on my freetime. We use the basement usually to jam with my friends so there'll be some amps etc. laying around which you're free to use!",
    capacity: 6,
    city: "London",
    country: "United Kingdom",
    postcode: 'SW9 0PZ'
  },
  {
    name: "Extra futon in pool house",
    photo: ["ba1-room1.jpg", "ba1-room2.jpg", "ba1-room3.jpg", "ba1-room4.jpg"],
    description: "Sleeps 3 or 4, poolhouse has basic amenaties, eg. wifi and heating, but no bathroom access. You are welcome to use the house bath of course.",
    bio: "Hello, I'm Raul, I'm a freelance artist and developer. Spend quite a lot of time at home during the day, so love to hang out with people who stay with me. Let's get a beer and get to know each other!",
    capacity: 4,
    city: "Barcelona",
    country: "Spain",
    postcode: "08007"
  },
  {
    name: "Spacious top floor room",
    photo: ["ba2-room1.jpg", "ba2-room2.jpg", "ba2-room3.jpg", "ba2-room4.jpg"],
    description: "Sleeps 4, maybe 5 people if you want to squeeze. Wifi and heating. Top floor has no bathroom, but there's a big shared bath on the first floor which you're welcome to use. No kitchen access sorry, but great takeout around!",
    bio: "Hello fellow artist! My name is Frederico, I live in Barcelona and welcome everyone to come stay with me. In exhange i'd love to go and see your gig!",
    capacity: 5,
    city: "Barcelona",
    country: "Spain",
    postcode: "08002"
  },
  {
    name: "Extra room with double bed and sofa",
    photo: ["ba3-room1.jpg", "ba3-room2.jpg", "ba3-room3.jpg", "ba3-room4.jpg"],
    description: "Sleeps 4 people, we have Wifi and heating. You can use the kitchen and the bathroom of course.",
    bio: "Hola, I'm Valentina. I like to sing, and love music so it's very fun to host other musiclovers in my house.",
    capacity: 4,
    city: "Barcelona",
    country: "Spain",
    postcode: "08005"
  },
  {
    name: "Extra room with own shower",
    photo: ["ber1-room1.jpg", "ber1-room2.jpg", "ber1-room3.jpg", "ber1-room4.jpg"],
    description: "Sleeps 2, amenities include Wifi and use of kitchen. There's three of us in the house and we like to hang in the communal areas a lot, with people me meet while we host!",
    bio: "Hallo! My name is Sofia, I live in a spacious house with my two friends. We're very social and love to meet new people, show them around berlin and hopefully we'll also be able to listen to some of their music!",
    capacity: 2,
    city: "Berlin",
    country: "Germany",
    postcode: "10823"
  },
  {
    name: "Spacious patio with room to practice",
    photo: ["ber2-room1.jpg", "ber2-room2.jpg", "ber2-room3.jpg", "ber2-room4.jpg"],
    description: "Sleeps 4 or 5, amenities include Wifi and use of communal bathroom. The patio has space for instruments too. Don't expect anything in return, but would love to hear you play of course! ",
    bio: "Hi! I'm called Noah, I live alone in a big loft with a patio (that's for you). I'm a chilled personality, happy to hang out once you get here!",
    capacity: 5,
    city: "Berlin",
    country: "Germany",
    postcode: "13349"
  },
  {
    name: "Basement room with mattresses",
    photo: ["ber3-room1.jpg", "ber3-room2.jpg", "ber3-room3.jpg", "ber3-room4.jpg"],
    description: "Sleeps 5 or more. We have wifi. There's lots of space for instruments too. Would love to hear you play, so i'd love to get tickets! ",
    bio: "Hallo! I am Elias, i'm the lead singer of our band Apfel und 'Birne', and we play Indie Rock. We love all music though, and often host fellow musicians in our relaxed band loft. Let's have a beer once you get here!",
    capacity: 5,
    city: "Berlin",
    country: "Germany",
    postcode: "12526"
  },
  {
    name: "Extra bedroom with own bath",
    photo: ["par1-room1.jpg", "par1-room2.jpg", "par1-room3.jpg", "par1-room4.jpg"],
    description: "Sleeps 2 or 3, access to kitchen, basement has own bathroom and shower.",
    bio: "Hey there, my name is Amelie, and I play the bass in our band 'Rhyme'. I actually met our singer Rosa here on Pitstop when she came to stay with me, so safe to say I love to host for other artists! I'm easy going, and always love to hear new music.",
    capacity: 3,
    city: "Paris",
    country: "France",
    postcode: "75011"
  },
  {
    name: "Big pullout couch in living room",
    photo: ["par2-room1.jpg", "par2-room2.jpg", "par2-room3.jpg", "par2-room4.jpg"],
    description: "Sleeps max 3 people, access to bathroom, but kitchen is very small, I recommend eating out, there's lots of places around. We have wifi.",
    bio: "Bonjour, I'm Pierre, and I love music. I often hang out with musicians and as a freelance job, I write articles on artist and new music they produce. ",
    capacity: 3,
    city: "Paris",
    country: "France",
    postcode: "75012"
  },
  {
    name: "Large spareroom with fireplace",
    photo: ["par3-room1.jpg", "par3-room2.jpg", "par3-room3.jpg", "par3-room4.jpg"],
    description: "Sleeps 5 people with wifi, pullout sofa and a mattress. One bathroom in the house, so we share. I recommend eating out, but if you really want to, you can use the kitchen.",
    bio: "Nice to meet you my name is Marie, and I welcome everyone to stay with me! I play some instruments and like to jam with my guests. Hope you're next! ",
    capacity: 5,
    city: "Paris",
    country: "France",
    postcode: "75004"
  }
]


room_details.each do |room_detail|
  images_to_attach = []

room_detail[:photo].each do |photo|
  uploaded_file = Cloudinary::Uploader.upload(File.join("app/assets/images/room-images-pitstop", photo))
        images_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' }

end

  room = Room.new(
    name: room_detail[:name],
    description: room_detail[:description],
    capacity: room_detail[:capacity],
    parking: ["street parking", "private parking", "car park", "unavailable"].sample,
    bio: room_detail[:bio],
    postcode: room_detail[:postcode],
    city: room_detail[:city],
    country: room_detail[:country],
    user_id: User.pluck(:id).sample,
    photos: images_to_attach
    )
  room.save
  puts "room saved"
end





























