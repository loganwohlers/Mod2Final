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

   def order_by_power (teams)
		teams.sort_by {|t| t.power_score}.reverse
   end

   def whole_bracket (teams, size)
	ordered_teams=order_by_power(teams)
	brack_order=bracket_order(size)
	map_bracket(ordered_teams, brack_order)
   end

	def seed_teams (teams)
		ordered_teams = order_by_power(teams)
		seeded=[]
		#array of arays(each being a matchup)
		for i in 0..ordered_teams.length/2-1
			seeded.push(ordered_teams[i])
			seeded.push(ordered_teams[-i-1])
		end
	end
	
	def bracket_order(entrants)
		starting=[1,4,3,2]
		if entrants==4
			return starting
		else
			#number of times we are going to "grow/double" the bracket(assuming they start w/ >4 teams)
			#-2 because we are already starting at 4 (2^2) 
			for i in 1..(Math.log2(entrants)-2)
				starting=double_bracket(starting)
			end
			return starting
		end		
	end

	def double_bracket(bracket)
		doubled_size=bracket.length*2
		doubled=[]
		bracket.each do |seed|
			doubled.push(seed)
			doubled.push((doubled_size+1)-seed)
		end
		doubled
	end

	def map_bracket (ordered_teams, bracket_order)
		for i in 0..(bracket_order.length-1)
		  team=ordered_teams[(bracket_order[i]-1)]
		  bracket_order[i]=team
		end
		bracket_order
	end
	
  
end