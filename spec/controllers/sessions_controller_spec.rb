require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when login is valid" do
      it "returns http success" do
        post :create, { email: 'valid@email.com', password: '12345678' }
        expect(response).to have_http_status(:redirect)
      end

      it "redirects to user_path" do
        post :create, { email: 'valid@email.com', password: '12345678' }
        expect(response).to redirect_to(User)
      end
    end

    context "when login is invalid" do
      it "returns http unauthorized" do
        post :create, { email: 'valid@email.com', password: 'password' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET #destroy" do
    skip "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
