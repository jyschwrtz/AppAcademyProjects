require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Get #new' do
    it 'renders the new user page' do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post #create' do
    context 'with invalid params' do
      it "validates the presence of password" do
        post :create, params: { user: { username: "jay" } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it "validates password with length of 6" do
        post :create, params: { user: { username: "jay", password: "l"} }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it "redirects to goals index page" do
        post :create, params: { user: { username: "jay", password: "password" } }
        expect(response).to redirect_to(goals_url)
      end
    end
  end
end
