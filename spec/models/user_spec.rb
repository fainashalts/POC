require "rails_helper"

describe User, :type => :model do

	it "has a name" do
		expect(user.name).to_not be_nil
	end

	it "has an email" do
		expect(user.email).to_not be_nil
	end

	it "has a password" do
		expect(user.password).to_not be_nil
	end

end