require 'rails_helper'

describe "Subtopics API", :type => :request do 
  it "returns a list of subtopics" do
    FactoryGirl.create_list(:subtopic, 10)
    get "api/subtopics"
    expect(response).to have_http_status 200

    subtopics = JSON.parse(response.body)
    expect(subtopics.count).to eq(10)
  end

  it "creates a new subtopic" do
    subtopic_attributes = {:subtopic => FactoryGirl.attributes_for(:subtopic)}.to_json
    post "api/subtopics", subtopic_attributes, request_headers
    subtopic = JSON.parse(response.body)
    expect(response).to have_http_status 201
    expect(response.location).to eq("localhost:3000/api/subtopics/#{subtopic['id']}")
  end

end