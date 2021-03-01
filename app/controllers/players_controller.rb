class PlayersController < ApplicationController
    before_action :find_player, only:[:show, :edit, :update, :destroy]
    # before_action :authorize, except: []
    #show /show all page
    def index
        @players = Player.all
        # @player = current_user.players
    end

    def in_order
        @players = Player.in_order 
    end

    #Get /read action for a single object
    def show 
    end 
        
    
    #Post /create action
    def create 
        @player = Player.new(player_params)
        # Assign all matches to the current user
        @player.matches.each do |match|
          match.user = current_user
        end

        if @player.save
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
        @player.matches.build
        @player.save
    end
    
    #Get /edit form 
    def edit
    end
    
    #Post /update action
    def update
        @player.update(player_params)
        redirect_to user_player_path(@player.id)
    end 
    
    #Post /destroy action
    def destroy 
        @player.destroy
        redirect_to user_players_path
    end

    private
    def player_params
        params.require(:player).permit(:name, :player_number, :starter, matches_attributes:[:id, :valid_match])
    end

    def find_player
        @player = Player.find(params[:id])
    end
    #Getting infinite loop

end

