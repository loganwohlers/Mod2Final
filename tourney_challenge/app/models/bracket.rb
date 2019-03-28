class Bracket < ApplicationRecord
	belongs_to :user
	has_many :team_brackets
	has_many :teams, through: :team_brackets

	def play_game(t1, t2)
		t1sauce=special_sauce(t1)
		t2sauce=special_sauce(t2)

		outcome=t1sauce-t2sauce

		if outcome>=0
			return 0
		else
			return 1
		end
   end

   def special_sauce (team)
		team.power_score*rand(0.93..1.15)*rand(1-team.team_spirit/100...1+team.team_spirit/100)
   end

   def order_teams
		self.teams.sort_by {|t| t.power_score}.reverse
   end

   def whole_bracket
		ordered_teams=self.order_teams
		brack_order=bracket_order(self.entrants)
		map_bracket(ordered_teams, brack_order)
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