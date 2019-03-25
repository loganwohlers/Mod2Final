class Bracket < ApplicationRecord
   
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

        for i in 0..ordered_teams.length/2-1
            seeded.push(ordered_teams[i])
            seeded.push(ordered_teams[-i-1])             
        end
        seeded
     end
end
