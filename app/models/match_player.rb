class MatchPlayer < ActiveRecord::Base
    belongs_to :match
    belongs_to :player
    accepts_nested_attributes_for :player
    # Must be singular
    # Sets up a 1:1 connection with another model - match && model
    # Matches_Players associated to match && player via
    # 'match_id && player_id' matches_players table.
    # This is my join
end