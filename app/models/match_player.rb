class MatchPlayer < ActiveRecord::Base
    belongs_to :match
    belongs_to :player

    # Must be singular
    # Sets up a 1:1 connection with another model - match && model
    # Matches_Players associated to match && player via
    # 'match_id && player_id' matches_players table.
    # This is my join
end

# I NEED TO DB:ROLLBACK ALL THE WAY TO MATCHPLAYER THEN 
# RAILS G RESEOURCE MATCH_NUMBER:INTEGER MATCH_DATE:DATE 
# RAILS G RESOURCE PLAYER NAME PLAYER_NUMBER:INTEGER

