require 'faker'

20.times do 
    Match.create( 
    name: Faker::Boolean.boolean,
    user_id: User.all.sample.id,
    player_id: Player.all.sample.id )
end

20.times do 
    User.create(email: Faker::Internet.email, password: "helloworld")
 end


 20.times do 
    Player.create(
        name: Faker::Name.name, 
        player_number: Faker::Number.between(from: 1, to: 50))
 end

#     Player.create(
#     name: Faker::Name.name, 
#     player_number: Faker::Number.between(from: 1, to: 50),
#     users_attributes: [
#         {
#             {email: Faker::Internet.email}
#         }
#     ]
# )



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#players
#user.all.sample.id
#match.all.sample.id