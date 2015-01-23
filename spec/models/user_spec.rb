require "rails_helper"

 describe User, :type => :model do
 
 	it "has a name" do
		# The user references the FactoryGirl "user" factory to create an example user to run the rspec tests
 		user = FactoryGirl.build_stubbed(:a_user)
 		expect(user.name).to_not be_nil
 	end
 
 	it "has an email" do
		# The user references the FactoryGirl "user" factory to create an example user to run the rspec tests
 		user = FactoryGirl.build_stubbed(:a_user)
 		expect(user.email).to_not be_nil
 	end
 
 	it "has a password" do
		# The user references the FactoryGirl "user" factory to create an example user to run the rspec tests
 		user = FactoryGirl.build_stubbed(:a_user)
 		expect(user.password).to_not be_nil
 	end

 end


