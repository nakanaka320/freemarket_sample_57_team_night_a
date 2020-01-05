require 'rails_helper'
describe UsersController do
  describe 'GET #step1' do

    pending "assigns the requested user to @user" do
      user = build(:user)
      get :step1 ,params: { id: user
        # id: user,
        # nickname: user,
        # email: user,
        # password: user,
        # password_confirmation: user,
        # first_name: user,
        # last_name: user,
        # first_name_kana: user,
        # last_name_kana: user,
        # birthday_year: user,
        # birthday_month: user,
        # birthday: user,
        # phone_number: user,
        # post_number: user,
        # prefecture: user,
        # city: user,
        # street: user,
        # building: user
      }
      expect(assigns(:user)).to eq user         #よくわからん
    end

    it "renders the :step1 template" do
      user = build(:user)
      get :step1 
      expect(response).to render_template :step1
    end
  end
end