class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :links
  # acts_as_voter allows the user to play the role of a voter for upvoting links. Part of the acts_as_votable gem setup.
  acts_as_voter
end
