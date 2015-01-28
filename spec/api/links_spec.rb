require 'rails_helper'

describe "Links API", :type => :request do
  it "returns a list of links" do
    FactoryGirl.create_list(:link, 10)
    get "api/links"
    expect(response).to have_http_status 200

    links = JSON.parse(response.body)
    expect(links.count).to eq(10)
  end

  it "creates a new link" do 
    link_attributes = {"link"=> FactoryGirl.attributes_for(:link)}.to_json
    post "/api/links", link_attributes, request_headers
    link = JSON.parse(response.body)
    expect(response).to have_http_status 201
    expect(response.location).to eq("localhost:3000/api/links/#{link['id']}")
  end
end