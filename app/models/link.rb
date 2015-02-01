class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :subtopic
	has_many :comments
  # acts as votable allows users to vote on on links. The link is a "votable" for the purpose of the acts_as_votable gem.
  acts_as_votable
  # validates_format_of :url, :with => URI::regexp(/^(http|https|ftp|ftps):\/\/(([a-z0-9]+\:)?[a-z0-9]+\@)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix), :on => :create



  def description
    self.title    
  end

  def as_json(options={})
    
      super(:except => [:user_id], :methods => [:description])
  end

end
