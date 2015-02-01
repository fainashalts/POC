FactoryGirl.define do 

	
	#Creating an example user in this factory allows us to reference it in the rspec file
	factory :a_user, class: User do

		name "Dummy"
		email "dummy@example.com"
		password "dummytimeseight"

	end

end