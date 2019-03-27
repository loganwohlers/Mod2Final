class TeamsController < ApplicationController
skip_before_action :authenticate_user, only: [:index, :show]
before_action :set_team, only: [:show, :edit, :update, :destroy]

    def index
            @teams=Team.all
        end

        def new
            @team=Team.new
            @team.athletes.build(name:Faker::Name.name, bio:Faker::Movie.quote, school: "uw", age: rand(18..24), image: UiFaces.face)


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
            params.require(:team).permit(:name, :school, :team_spirit, :history, :user_id, athletes_attributes: [:name, :age, :bio, :school, :offense, :defense, :image])
        end
end
