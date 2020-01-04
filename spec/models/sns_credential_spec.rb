require 'rails_helper'
describe SnsCredential do
  describe "#create" do
    it "is invalid without uid" do
      sns = build(:sns_credential, uid: "" , provider: "google")
      sns.valid?
      expect(sns.errors[:uid]).to include("を入力してください。")
    end

  end
end