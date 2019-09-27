class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_one :user
  has_many :tracks, through: :playlist_songs
  has_many :votes
end
