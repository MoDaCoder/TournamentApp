class User < ApplicationRecord
  has_many :matches
  has_many :players, through: :matches
  
  # has_many
  # Is plural
  # Sets up a many-to-many association using another model
  # The matchplayer would have both a 'match_id' && 'player_id'

  attr_reader :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end     
  end
end
