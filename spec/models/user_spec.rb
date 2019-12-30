require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
<<<<<<< HEAD
    end
  end
end

require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
=======
>>>>>>> 2e15b99f23481d57c770b2b93dd7c37607c7bce7
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
