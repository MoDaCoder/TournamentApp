class MatchesController < ApplicationController
    before_action :find_match, only:[:show, :edit, :update, :destroy]
    #show /show all page
    def index
        @matches = Match.all
    end

    #Get /read action for a single object
    def show 
    end         

    #Post /create action
    def create 
        # byebug
        @match = Match.new(match_params.merge(user_id: current_user.id))
        if @match.valid?
            @match.save
            redirect_to match_path(@match.id)
        else
            @errors = @match.errors.full_messages
            render :new
        end
    end

    #Get /render new form
    def new
        # byebug
        @match = current_user.matches.new
        # 4.times{@match.players.build}
    end

    #Get /edit form 
    def edit
    end

    #Post /update action
    def update
        @match.update(params.require(:match).permit(:match_number))
        redirect_to match_path(@match.id)    
    end 

    #Post /destroy action
    def destroy 
        @match.destroy
        redirect_to matches_path
    end

    private
    def match_params
        params.require(:match).permit(:match_number, :match_date, players_attributes:[:id, :name, :player_number])
    end

    def find_match
        @match = Match.find(params[:id])
    end
    
end