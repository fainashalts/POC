# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.destroy_all
Subtopic.destroy_all


	topics = Topic.create([
		{name: "Programming Languages"},
		{name: "Testing"}, 
		{name: "Version Control"}, 
		{name: "Database Design"}, 
		{name: "Data Science"}, 
		{name: "Mobile Development"}, 
		{name: "Web Design"}, 
		{name: "APIs"}, 
		{name: "Command Line"}, 
		{name: "Math for Programmers"}
	])

	subtopic = Subtopic.create([
		{name: "Javascript", topic_id: 1}, 
		{name: "HTML", topic_id: 1}, 
		{name: "CSS", topic_id: 1}, 
		{name: "Ruby", topic_id: 1}, 
		{name: "C", topic_id: 1}, 
		{name: "C++", topic_id: 1}, 
		{name: "Python", topic_id: 1}, 
		{name: "PHP", topic_id: 1}, 
		{name: "Test-Driven Development", topic_id: 2},
		{name: "Agile Methods", topic_id: 2},
		{name: "Testing Basics", topic_id: 2},
		{name: "Git", topic_id: 3},
		{name: "GitHub", topic_id: 3},
		{name: "Continuous Integration", topic_id: 3}, 
		{name: "Version Control Basics", topic_id: 3}, 
		{name: "SQL", topic_id: 4},
		{name: "NoSQL", topic_id: 4},
		{name: "Database Basics", topic_id: 4},
		{name: "Machine Learning", topic_id: 5},
		{name: "Modeling Techniques", topic_id: 5},
		{name: "Data Science Basics", topic_id: 5},
		{name: "iOS", topic_id: 6},
		{name: "Android", topic_id: 6},
		{name: "Windows Mobile", topic_id: 6},
		{name: "Mobile Development Basics", topic_id: 6},
		{name: "UX Design", topic_id: 7},
		{name: "Wireframing", topic_id: 7},
		{name: "Web Design Basics", topic_id: 7},
		{name: "Building an API", topic_id: 8},
		{name: "Consuming an API", topic_id: 8},
		{name: "API Basics", topic_id: 8},
		{name: "Command Line Basics", topic_id: 9},
		{name: "Command Line Tips and Tricks", topic_id: 9},
		{name: "Algorithms", topic_id: 10},
		{name: "Discrete Mathematics", topic_id: 10},
		{name: "Linear Algebra", topic_id: 10}
  ]) 

