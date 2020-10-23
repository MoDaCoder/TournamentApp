class PlayersController < ApplicationController
    before_action :find_player, only:[:show, :edit, :update, :destroy]
    before_action :authorize, except: []
    #show /show all page
    def index
        @players = Player.all
        # @player = current_user.players
    end

    #Get /read action for a single object
    def show 
    end 
        
    
    #Post /create action
    def create 
        @player = Player.new(player_params)
        if @player.valid?
            @player.save
            redirect_to user_player_path(current_user, @player.id)
            # redirect_to user_match_path(current_user, @match)
        else
            @errors = @player.errors.full_messages
            render :new  
        end    
    end
    
    #Get /render new form
    def new
        @player = Player.new
        
    end
    
    #Get /edit form 
    def edit
    end
    
    #Post /update action
    def update
        # byebug
        @player.update(params.require(:player).permit(:player_number))
        redirect_to user_player_path(@player.id)
    end 
    
    #Post /destroy action
    def destroy 
        @player.destroy
        redirect_to user_players_path
    end

    private
    def player_params
        params.require(:player).permit(:name, :player_number)
    end

    def find_player
        @player = Player.find(params[:id])
    end
    #Getting infinite loop

end

