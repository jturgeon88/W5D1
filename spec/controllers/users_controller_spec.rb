require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #new

  #create

  describe "GET #new" do
    it "renders new user page" do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end
end
