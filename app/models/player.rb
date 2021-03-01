class Player < ApplicationRecord
    has_many :matches, dependent: :destroy
    has_many :users, through: :matches

    scope :in_order, -> {where("LENGTH(name) < 10")}
    validates :name, presence:{message: "A player must have a name!"}
    validates :player_number, presence:true
    accepts_nested_attributes_for :matches

end
