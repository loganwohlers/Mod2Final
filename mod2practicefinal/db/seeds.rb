# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Athlete.destroy_all
Team.destroy_all
Bracket.destroy_all

#4x3

8.times do
    team=Team.create(
       name: Faker::Team.unique.creature,
       school: Faker::University.name,
       about: Faker::Movie.quote
     )
    10.times do
        Athlete.create(
            name: Faker::Name.name,
            age: rand(18..25),
            bio: Faker::Movie.quote,
            school: Faker::University.name,
            offense: rand(1..10),
            defense: rand(1..10),
            team_id: team.id
        )
    end
end

# bracket_test_teams=Team.all
Bracket.create(
    name: Faker::Color.color_name,
    status: 'Testing'
)



# a1={name: Faker::Name.name, team_id: Team.first.id}
# Athlete.create(a1)



# # #can use a unique name
# # # 5.times do 
#     Player.create(
#         name: Faker::Name.name
#         age: rand(18..25),
#          team_id: Team.first,
#          bio: Faker::Movie.quote,
#          school: Faker::University.name
# #     )
# # # end
