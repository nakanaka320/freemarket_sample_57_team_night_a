require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = build(:user, nickname: "")
     user.valid?
     binding.pry

     expect(user.errors[:nickname]).to include("を入力してください。")
    end
  end
end
