Athlete.destroy_all
Team.destroy_all
Bracket.destroy_all

#4x3
user = User.create(
	username: 'AI'
	)

16.times do
 team=Team.create(
    name: Faker::Team.unique.creature,
    school: Faker::University.name,
    history: Faker::Movie.quote,
    team_spirit: rand(0.9...1.05),
    user_id: user.id
  )
   10.times do
       Athlete.create(
         name: Faker::Name.name,
         age: rand(18..25),
         bio: Faker::Movie.quote,
         school: Faker::University.name,
         offense: rand(6.5...10.0),
         defense: rand(6.5...10.0),
        image: UiFaces.face,
         team_id: team.id

       )
   end
end

tournament = Tournament.create(
 	name: "Tourney1",
 	status: "Happening"
	)

# bracket_test_teams=Team.all
Bracket.create(
   name: Faker::Color.color_name,
   tournament_id: tournament.id,
   user_id: user.id
)
