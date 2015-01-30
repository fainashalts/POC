class Subtopic < ActiveRecord::Base
	belongs_to :topic
  has_many :links

  def description
    self.name
  end

  def link_count
    self.links.count
  end

  def as_json(options={})
    super(
      :include => :links
      )
  end
end
