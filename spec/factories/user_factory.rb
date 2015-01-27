FactoryGirl.define do 

	
	#Creating an example user in this factory allows us to reference it in the rspec file
	factory :user do

		name "Dummy"
		email "dummy@example.com"
		password "dummy1234"

	end

end