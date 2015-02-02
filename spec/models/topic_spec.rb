require "rails_helper"

describe Topic do
	it "has a valid factory" do
    expect(FactoryGirl.build(:topic)).to be_valid
  end
  
  it "has a name" do
		topic = FactoryGirl.build(:topic)
    expect(topic.name).to_not be_nil
	end

end