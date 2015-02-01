require 'rails_helper'

describe "Topics API", :type => :request do 
  it "returns a list of topics" do
    FactoryGirl.create_list(:topic, 10)
    get "api/topics"
    expect(response).to have_http_status 200

    topics = JSON.parse(response.body)
    expect(topics.count).to eq(10)
  end

  # it "creates a new topic" do
  #   topic_attributes = {"topic" => FactoryGirl.attributes_for(:topic)}
  #   post "/api/topics", topic_attributes
  #   topic = JSON.parse(response.body)
  #   expect(response).to have_http_status 201
  #   expect(response.location).to eq("http://www.example.com/api/topics/#{topic['id']}")
  # end

end