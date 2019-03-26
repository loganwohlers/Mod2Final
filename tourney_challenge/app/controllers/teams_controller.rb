class TeamsController < ApplicationController

before_action :set_team, only: [:show, :edit, :update, :destroy]
    def index
            @teams=Team.all
        end
    
        def new
            @team=Team.new
        end
    
        def create
            @team=Team.new(team_params)

            if @team.save
                redirect_to team_path(@team)
            else
                render :new
            end
        end
    
        def show
        end
    
        def edit
        end
        
        def update
            @team.update(team_params)
            redirect_to team_path(@example)
        end

        def destroy
            @team.destroy
            redirect_to teams_path
        end
    
        private

        def set_team
            @team=Team.find(params[:id])
        end

        def team_params
            params.require(:team).permit!
        end
end
