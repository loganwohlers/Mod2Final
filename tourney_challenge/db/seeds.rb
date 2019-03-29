Athlete.destroy_all
Team.destroy_all
Bracket.destroy_all
TeamBracket.destroy_all
AthleteTeam.destroy_all
User.destroy_all

user = User.create(username: 'AI', password: 'robot', password_digest: 'robot')

bracket = Bracket.create(name: Faker::Color.color_name, user_id: user.id, entrants: 16)

64.times do
   team=Team.new(
      name: Faker::Team.unique.creature,
      school: Faker::University.name,
      history: Faker::University.name,
      team_spirit: rand(1.0...25.0),
      user_id: user.id
   )
   
   athletes = []
   5.times do 
      athlete=Athlete.create(
         name:Faker::Name.name,
         age: rand(18..25),
         bio: Faker::GreekPhilosophers.quote,
         school: Faker::University.name,
         offense: rand(1.0...10.0),
         defense: rand(1.0...10.0),
         image: UiFaces.face
      )
      athletes << athlete
      #AthleteTeam.create(team_id: team.id, athlete_id: athlete.id)
   end 

   team.athletes = athletes
   team.save

   TeamBracket.create(team_id: team.id, bracket_id: bracket.id)
end
