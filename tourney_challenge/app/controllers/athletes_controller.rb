class AthletesController < ApplicationController

    before_action :set_athlete, only: [:show, :edit, :update, :destroy]
        def index
                @athletes=Athlete.all
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
        
            def edit
            end
            
            def update
                @athlete.update(athlete_params)
                redirect_to athlete_path(@example)
            end
    
            def destroy
                @athlete.destroy
                redirect_to athletes_path
            end
        
            private
    
            def set_athlete
                @athlete=Athlete.find(params[:id])
            end
    
            def athlete_params
                params.require(:athlete).permit!
            end
end
