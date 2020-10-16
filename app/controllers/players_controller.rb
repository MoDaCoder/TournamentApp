class PlayersController < ApplicationController
    before_action :find_match, only:[:show, :edit, :update, :destroy]

    #show /show all page
    def index
        @players = Player.all
        # @player = current_user.players
    end
    
    #Post /create action
    def create 
        @player = Player.new(name: params[:player][:name], player_number: params[:player][:player_number])
        if @player.valid?
            @player.save
            redirect_to player_path(@player.id)
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
    
    #Get /read action for a single object
    def show 
    end 
    
    #Post /update action
    def update
    end 
    
    #Post /destroy action
    def destroy 
        @player.destroy
        redirect_to players_path
    end

    private
    def find_match
        @player = Player.find(params[:id])
    end
end

