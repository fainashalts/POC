require 'rails_helper'

RSpec.describe UsersController, :type => :controller do 

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
 #SHOW
  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:a_user)
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end

    it "renders the #show view" do
      user = FactoryGirl.create(:a_user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

end