FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
	
	#Creating an example user in this factory allows us to reference it in the rspec file
	factory :user do
		name "Dummy"
		email 
		password "dummy1234" 
    # password has to be minimum 8 characters due to validation
	end

end