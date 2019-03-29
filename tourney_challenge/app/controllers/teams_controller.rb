class TeamsController < ApplicationController
skip_before_action :authenticate_user, only: [:index, :show]
before_action :set_team, only: [:show, :edit, :update, :destroy]

        def index
            @teams=Team.all.order(name: :asc)
           
        end

        def new
            @team=Team.new
            @athletes=Athlete.order("RANDOM()").limit(7)


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

        private

        def set_team
            @team=Team.find(params[:id])
        end

        def team_params
            params.require(:team).permit(:name, :school, :team_spirit, :history, :user_id, :athlete_ids => [])
        end
end
