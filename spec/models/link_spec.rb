require "rails_helper"

describe Link do
	link = FactoryGirl.build(:link)
  it "has a url" do
    expect(link.url).to_not be_nil
	end

	
end
