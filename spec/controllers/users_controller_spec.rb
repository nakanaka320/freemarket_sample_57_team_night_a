require 'rails_helper'
describe UsersController do
  describe 'GET #step1' do

    pending "assigns the requested user to @user" do
      user = build(:user)
      get :step1 ,params: { id: user}
      expect(assigns(:user)).to eq user         
    end

    it "renders the :step1 template" do
      user = build(:user)
      get :step1 
      expect(response).to render_template :step1
    end
  end
end