# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
puts "Generating users..."
100.times do
  username = Faker::Internet.username(separators: %w(. _ -))
  User.create(username: username)
end
puts "Users successfully generated!"

puts "Generating artworks..."
1000.times do
  title = Faker::App.name + Faker::App.semantic_version
  image_url = Faker::Internet.url
  artist_id = 1 + rand(100)
  artwork = Artwork.new(title: title, image_url: image_url, artist_id: artist_id)
  unless artwork.save
    next
  end
end
puts "Artworks generated!"

puts "Generating shares..."
10000.times do
  viewer_id = 1 + rand(100)
  artwork_id = 1 + rand(1000)
  share = ArtworkShare.new(viewer_id: viewer_id, artwork_id: artwork_id)
  unless share.save
    next
  end
end
puts "Shares generated!"

puts "Generating comments..."
10000.times do
  user_id = 1 + rand(100)
  artwork_id = 1 + rand(1000)
  body = Faker::Lorem.sentences(number: 1)[0]
  comment = Comment.new(user_id: user_id, artwork_id: artwork_id, body: body)
  unless comment.save
    next
  end
end
puts "Comments generated!"