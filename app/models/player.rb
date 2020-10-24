class Player < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    default_scope { where(starter: true)}
    validates :name, presence:{message: "A player must have a name!"}
    validates :player_number, presence:true
    accepts_nested_attributes_for :matches
    # accepts_nested_attributes_for :matches, reject_if: proc { |attributes| attributes[:match_date].blank? || attributes[:match_number].blank?}
end
