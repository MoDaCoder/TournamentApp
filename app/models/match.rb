class Match < ActiveRecord::Base
    has_many :matches_players, dependent: :delete_all
    has_many :players, through: :matches_players
    belongs_to :user 

    # has_many :through
    # Is plural
    # Indicates a one-to-many association
    # A Match can have many matchplayers, players, and users in this instance
    # A matchplayer && player associated via 'matchplayer_id'

    validates :match_number, presence:{message: "A match must have a number!"}
    validates :match_date, presence:true
    accepts_nested_attributes_for :players, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:player_number].blank?}
end
