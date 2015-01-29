class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :subtopic
	has_many :comments
  # acts as votable allows users to vote on on links. The link is a "votable" for the purpose of the acts_as_votable gem.
  acts_as_votable

  def description
    self.title    
  end

  def as_json(options={})
    
      super(:except => [:user_id], :methods => [:description])
  end
end
