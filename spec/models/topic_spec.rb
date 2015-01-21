require "rails_helper"

describe Topic do
	it "has a name" do
		expect(topic.name).to_not be_nil
	end

end