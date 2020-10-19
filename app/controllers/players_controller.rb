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
        @player = Player.new(player_params.merge(user_id: current_user.id))
        if @player.valid?
            @player.save
            redirect_to player_path(@player)
        else
            @errors = @player.errors.full_messages
            render :new  
        end    
    end
    
    #Get /render new form
    def new
        @player = current_user.players.new
    end
    
    #Get /edit form 
    def edit
    end
    
    #Post /update action
    def update
        @player.update(params.require(:player).permit(:player_number))
        redirect_to player_path(@player.id)
    end 
    
    #Post /destroy action
    def destroy 
        @player.destroy
        redirect_to players_path
    end

    private
    def player_params
        params.require(:player).permit(:name, :player_number)
    end

    def find_player
        @player = Player.find(params[:id])
    end

end

