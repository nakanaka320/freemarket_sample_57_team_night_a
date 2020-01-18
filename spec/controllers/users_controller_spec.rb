require 'rails_helper'
describe UsersController do
  describe 'GET #step1' do

    it "step1のビューへ遷移するかどうか" do
      user = build(:user)
      get :step1 
      expect(response).to render_template :step1
    end
    
  end
end