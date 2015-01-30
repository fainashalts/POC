class Topic < ActiveRecord::Base
	has_many :subtopics

  def description 
    self.name
  end


  def as_json(options={})
    super(
      {:only => :name, 
      :include => {:subtopics => {:methods => [:link_count]}} 


      })
  end
end
