class BracketsController < ApplicationController
    before_action :set_bracket, only: [:show, :edit, :update, :destroy]
        def index
                @brackets=Bracket.all.order(entrants: :desc)
            end
        
            def new
                @bracket=Bracket.new
            end
        
            def create
                @bracket=Bracket.new(bracket_params)
    
                if @bracket.save
                    teams=Team.order("RANDOM()").limit(@bracket.entrants)
                    teams.each do |t|
                        TeamBracket.create(bracket_id: @bracket.id, team_id: t.id)
                    end
                    redirect_to bracket_path(@bracket)
                else
                    render :new
                end
            end
        
            def show
                
            end
        
        
            private
    
            def set_bracket
                @bracket=Bracket.find(params[:id])
            end
    
            def bracket_params
                params.require(:bracket).permit!
            end
end
