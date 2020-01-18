require 'rails_helper'
describe SnsCredential do
  describe "#create" do
    it "uidが空の場合登録不可" do
      sns = build(:sns_credential, uid: "" )
      sns.valid?
      expect(sns.errors[:uid]).to include("を入力してください。")
    end

    it "providerが空の場合登録不可" do
      sns = build(:sns_credential,  provider: "")
      sns.valid?
      expect(sns.errors[:provider]).to include("を入力してください。")
    end
  end
end