require 'rails_helper'

RSpec.describe Subtopic, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:subtopic)).to be_valid
  end
  
  it "has a name" do
    subtopic = FactoryGirl.build(:subtopic)
    expect(subtopic.name).to_not be_nil
  end

  it "belongs to a topic" do
    subtopic = FactoryGirl.build(:subtopic)
    expect(subtopic.topic_id).to_not be_nil
  end
end
