class BracketsController < ApplicationController

    before_action :set_bracket, only: [:show, :edit, :update, :destroy]
            def index
                @brackets=Bracket.all
            end
        
            def new
                @bracket=Bracket.new
            end
        
            def create
                @bracket=Bracket.new(bracket_params)
    
                if @bracket.save
                    redirect_to bracket_path(@bracket)
                else
                    render :new
                end
            end
        
            def show
                #order this highest to lowest
                @teams=Team.all
                # @teams=Team.order(power_score: :desc)
            end
        
            def edit
            end
            
            def update
                @bracket.update(bracket_params)
                redirect_to bracket_path(@example)
            end
    
            def destroy
                @bracket.destroy
                redirect_to brackets_path
            end
        
            private
    
            def set_bracket
                @bracket=Bracket.find(params[:id])
            end
    
            def bracket_params
                params.require(:bracket).permit!
            end
end
