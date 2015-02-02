require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do
  
  before :each do
    controller.stub(:authenticate_user!)
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      user = FactoryGirl.build_stubbed(:a_user)
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      user = FactoryGirl.build_stubbed(:a_user)
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do

    it "responds successfully with an HTTP status code of 200" do 
      user = FactoryGirl.build_stubbed(:a_user)
      topic = FactoryGirl.create(:topic)
      get :show, id: topic

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end 

    it "renders the show template" do
      user = FactoryGirl.build_stubbed(:a_user)
      topic = FactoryGirl.create(:topic)
      get :show, id: topic

      expect(response).to render_template(:show)
    end 
  end

  



end