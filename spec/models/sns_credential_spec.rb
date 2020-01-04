# require 'rails_helper'
# describe SnsCredential do
#   describe "#create" do
#     it "is invalid without uid" do
#       sns = SnsCredential.new( uid: "", provider: "google")
#       sns.valid?
#       expect(sns.errors[:uid]).to include("can't be blank")
#     end
#   end
# end