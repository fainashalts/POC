require 'rails_helper'

RSpec.describe Comment, :type => :model do
  
  # need a factory
  it "has a valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  # comments should have a username to show who posted them
  it "is invalid without a username" do
    comment = FactoryGirl.build(:comment, user_id: nil)
    expect(comment).to be_invalid
  end

  # comments should have links they are attached to
  it 'has a link' do
    comment = FactoryGirl.create(:comment, link_id: 1)
    expect(comment).to be_valid
  end


end
