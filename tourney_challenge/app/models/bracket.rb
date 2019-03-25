class Bracket < ApplicationRecord
	belongs_to :tournament
	belongs_to :user

   def play_game(t1, t2)

       outcome=t1.power_score-t2.power_score

       if outcome>=0
           return 0
       else
           return 1
       end
   end

    def seed_teams (ordered_teams)
       seeded=[]

       #array of arays(each being a matchup)
       two_d=[]
       for i in 0..ordered_teams.length/2-1
           to_add=[]
           to_add.push(ordered_teams[i])
           to_add.push(ordered_teams[-i-1])
           two_d.push(to_add)
       end


       #recursively and pass in a thing?
       for i in 0..two_d.length/2/4-1
            seeded.push(two_d[i])
            seeded.push(two_d[-i-1])
            seeded.push(two_d[i+3])
            seeded.push(two_d[-(i+3)-1])
            seeded.push(two_d[i+1])
            seeded.push(two_d[-(i+1)-1])
            seeded.push(two_d[i+2])
            seeded.push(two_d[-(i+2)-1])
       end

       seeded=seeded.flatten
       seeded.map do |t|
           t.name
       end
   end
end