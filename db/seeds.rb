# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.destroy_all
Subtopic.destroy_all

Topic.destroy_all
Subtopic.destroy_all


	topics = Topic.create([
		{name: "Javascript"},
		{name: "Ruby"},
		{name: "HTML"},
		{name: "CSS"}
	])

  subtopic = Subtopic.create([
    {name: "EmberJS", topic_id: 1},
    {name: "AngularJS", topic_id: 1}, 
    {name: "Rails", topic_id: 2}, 
    {name: "HTML5", topic_id: 3}
    ]) 

