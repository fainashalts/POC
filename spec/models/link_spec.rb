require "rails_helper"

describe Link do
	it "has a valid factory" do
    expect(FactoryGirl.build(:link)).to be_valid
  end

  
  it "has a url" do
    link = FactoryGirl.build(:link)
    expect(link.url).to_not be_nil
	end

  it "is related to a particular subtopic" do
    link = FactoryGirl.build(:link, subtopic_id: 2)
    expect(link).to be_valid
  end

  it "belongs to the user that posted it" do
    link = FactoryGirl.build(:link, user_id: 2)
    expect(link.user_id).to be(2)
  end

	
end
