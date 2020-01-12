require 'rails_helper'
describe UsersController do
  describe 'GET #step1' do

    it "renders the :step1 template" do
      user = build(:user)
      get :step1 
      expect(response).to render_template :step1
    end
    
  end
end