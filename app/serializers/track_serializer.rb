class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :preview, :spotify_id
end
