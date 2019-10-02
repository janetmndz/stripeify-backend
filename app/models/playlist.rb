class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs, dependent: :destroy
  has_many :tracks, through: :playlist_songs
  has_many :votes, dependent: :destroy
end
