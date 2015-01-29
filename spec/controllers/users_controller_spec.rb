RSpec.describe UsersController, :type => :controller do 

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do 
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        end

    it "renders the index template" do 
      get :index
      expect(response).to render_template("index")
    end 
  end
 #SHOW
  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end

    it "renders the #show view" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  #NEW
  describe "GET #new" do 
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  #CREATE

    #EDIT
    #UPDATE
end