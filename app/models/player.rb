class Player < ApplicationRecord
    has_many :match_players
    has_many :matches, through: :matches_players
    belongs_to :user

    # has_many :through
    # Is plural
    # Sets up a many-to-many association using another model
    # The matchplayer would have both a 'match_id' && 'player_id'
    # Belongs to a user
    validates :name, presence:{message: "A player must have a name!"}
    validates :player_number, presence:true
end
