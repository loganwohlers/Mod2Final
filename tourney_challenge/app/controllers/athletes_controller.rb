class AthletesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]
  before_action :set_athlete, only: [:show, :edit, :update, :destroy]

        def index
                @athletes=Athlete.all.order(name: :asc)
                
            end

            def new
                @athlete=Athlete.new
            end

            def create
                @athlete=Athlete.new(athlete_params)

                if @athlete.save
                    redirect_to athlete_path(@athlete)
                else
                    render :new
                end
            end

            def show
            end
            
            private

            def set_athlete
                @athlete=Athlete.find(params[:id])
            end

            def athlete_params
                params.require(:athlete).permit!
            end
end
