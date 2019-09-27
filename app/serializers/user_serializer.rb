class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :playlists
end
