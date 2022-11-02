# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


10.times do
    City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip)
end


10.times do
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: Faker::Internet.free_email, age: Faker::Number.number(digits: 2), city_id: City.all.sample.id)
end


20.times do
    Gossip.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id)
end


10.times do
    Tag.create!(title: Faker::Lorem.sentence)
end


10.times do
    GossipTag.create!(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
end


50.times do 
    PrivateMessage.create!(content: Faker::Lorem.paragraph, sender_id: User.all.sample.id)
end


50.times do 
    Recipient.create!(private_message_id: PrivateMessage.all.sample.id, recipient_id: User.all.sample.id)
end


50.times do
    Comment.create!(content: "Il fait beau ! Wouaaa!", gossip_id: Gossip.all.sample.id, user_id: User.all.sample.id)
end


20.times do
    LikeComment.create!(user_id: User.all.sample.id, comment_id: Comment.all.sample.id)
end


20.times do
    LikeGossip.create!(gossip_id: Gossip.all.sample.id, user_id: User.all.sample.id,)
end