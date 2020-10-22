class Player < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    # has_many :through
    # Is plural
    # Sets up a many-to-many association using another model
    # The matchplayer would have both a 'match_id' && 'player_id'
    # Belongs to a user
    validates :name, presence:{message: "A player must have a name!"}
    validates :player_number, presence:true

    accepts_nested_attributes_for :matches, reject_if: proc { |attributes| attributes[:match_date].blank? || attributes[:match_number].blank?}
end
