class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
  # acts as votable allows users to vote on on links. The link is a "votable" for the purpose of the acts_as_votable gem.
  acts_as_votable
end
