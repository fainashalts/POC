class Topic < ActiveRecord::Base
	has_many :links
	has_many :subtopics
end
