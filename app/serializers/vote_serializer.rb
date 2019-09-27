class VoteSerializer < ActiveModel::Serializer
  attributes :id, :upvote, :user_id
  has_one :user
  has_one :playlist
end
