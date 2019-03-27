Athlete.destroy_all
Team.destroy_all
Bracket.destroy_all
TeamBracket.destroy_all
AthleteTeam.destroy_all
User.destroy_all

user = User.create(username: 'AI')

bracket = Bracket.create(name: Faker::Color.color_name, user_id: user.id)

16.times do
   team=Team.create(
      name: Faker::Team.unique.creature,
      school: Faker::University.name,
      history: Faker::Movie.quote,
      team_spirit: rand(1.0...50.0),
      user_id: user.id
   )
   TeamBracket.create(team_id: team.id, bracket_id: bracket.id)

      5.times do 
         athlete=Athlete.create(
            name:Faker::Name.name,
            age: rand(18..25),
            bio: Faker::Movie.quote,
            school: Faker::University.name,
            offense: rand(6.5...10.0),
            defense: rand(6.5...10.0),
            image: UiFaces.face
         )
         AthleteTeam.create(team_id: team.id, athlete_id: athlete.id)
      end 
end
